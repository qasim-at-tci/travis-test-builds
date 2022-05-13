FROM arm64v8/ubuntu:latest
MAINTAINER demousr@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN df -h

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx

RUN df -h

CMD [“echo”,”Image created”]

RUN df -h
