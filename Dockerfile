FROM node:lts-bullseye-slim
RUN apt-get update -qqy \
&& apt-get install -qy curl \
&& curl -LO http://download.redis.io/releases/redis-5.0.14.tar.gz \
&& sha256sum redis-*.tar.gz
