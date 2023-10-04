#!/bin/bash

set -o xtrace

docker pull nginx
docker run -d -p 8080:80 nginx
ping -c3 travis-ci.com
touch test.log
echo "Hello, world!" > test.log
sleep 10
cat test.log
