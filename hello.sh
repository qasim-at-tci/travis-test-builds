#!/bin/bash

docker pull nginx
docker run -d -p 8080:80 nginx
curl -I http://localhost:8080

