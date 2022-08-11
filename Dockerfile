FROM thingsboard/openjdk8
RUN apt-get update
RUN apt-get install -y wget
RUN cat /etc/os-release
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ sid-pgdg main' | tee --append /etc/apt/sources.list.d/pgdg.list > /dev/null
RUN wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
