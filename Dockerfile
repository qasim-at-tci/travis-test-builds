FROM arm64v8/ubuntu:latest
MAINTAINER demousr@gmail.com

RUN df -h

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install –y nginx

RUN df -h

CMD [“echo”,”Image created”]

RUN df -h
