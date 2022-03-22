FROM quay.io/centos/centos:stream9
ARG CIRCLECI_TOOLS="git openssh-clients tar gzip ca-certificates glibc-locale-source glibc-langpack-en"
# set localtime to UTC and install basic build tools
RUN (ln -s /usr/share/zoneinfo/UTC /etc/localtime 2> /dev/null || true) \
    && dnf update -y \
    && dnf install -y sudo git make gcc autoconf automake libtool gettext file \
       ${CIRCLECI_TOOLS} \
    && dnf clean all \
    && localedef -c -f UTF-8 -i en_US en_US.UTF-8

ARG USER_NAME=ruby
RUN useradd -m -d "/home/${USER_NAME}" -l -G wheel ${USER_NAME} \
    && echo "${USER_NAME} ALL=(ALL:ALL) NOPASSWD: ALL" > \
    "/etc/sudoers.d/${USER_NAME}" \
    && chmod 0440 "/etc/sudoers.d/${USER_NAME}"

USER "${USER_NAME}"

# PostgreSQL installation
ARG POSTGRES_BUILD_DEPS="bison flex zlib-devel readline-devel openssl-devel"
RUN test "x${POSTGRES_BUILD_DEPS}" = "x" \
    || sudo dnf install -y ${POSTGRES_BUILD_DEPS}

ARG POSTGRES_VERSION=REL_10_17
RUN curl -sSLf "https://github.com/postgres/postgres/archive/${POSTGRES_VERSION}.tar.gz" \
    | tar -C "/home/${USER_NAME}" -xz
    
ARG POSTGRES_PREFIX=/usr/local
ARG POSTGRES_DATA_PREFIX=${POSTGRES_PREFIX}/pgsql
ARG POSTGRES_CONFIGURE_OPTIONS
ARG POSTGRES_MAKE_OPTIONS
RUN export
RUN cd ~/postgres-"${POSTGRES_VERSION}" \
    && ./configure --prefix="${POSTGRES_PREFIX}" --includedir=/usr/local/include \
       --with-openssl ${POSTGRES_CONFIGURE_OPTIONS} \
    && make ${POSTGRES_MAKE_OPTIONS}
RUN cd ~/postgres-"${POSTGRES_VERSION}" \
    && sudo make install \
    && rm -rf ~/postgres-"${POSTGRES_VERSION}" \
    # the test tooling expects the pg_ctl binary in this directory
    && sudo mkdir -p /usr/lib/postgresql/9.5/bin \
    && sudo ln -sf "${POSTGRES_PREFIX}/bin/pg_ctl" /usr/lib/postgresql/9.5/bin/pg_ctl \
    && sudo useradd postgres \
    && sudo mkdir -p "${POSTGRES_DATA_PREFIX}/data" \
    && sudo chown -R postgres: "${POSTGRES_DATA_PREFIX}" \
    && sudo chmod -R go-rwx "${POSTGRES_DATA_PREFIX}"
