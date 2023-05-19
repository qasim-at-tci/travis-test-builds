FROM ubuntu

RUN apt-get update && apt-get install bash curl vim make git wget gpg bzip2 -y
RUN apt-get install gcc -y

RUN curl https://dl.google.com/go/go1.16.6.linux-amd64.tar.gz -o go1.16.6.linux-amd64.tar.gz
RUN tar -xf go1.16.6.linux-amd64.tar.gz && mv go /usr/local/
ENV GOROOT /usr/local/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

RUN wget https://github.com/restic/restic/releases/download/v0.9.6/restic_0.9.6_linux_amd64.bz2
RUN bzip2 -d restic_0.9.6_linux_amd64.bz2
RUN cp restic_0.9.6_linux_amd64 /usr/local/bin/restic
RUN chmod +x /usr/local/bin/restic
RUN export GO111MODULE=on

ENV GOPATH /go
