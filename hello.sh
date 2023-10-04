#!/bin/bash

docker pull nginx
docker run -d -p 8080:80 nginx
git clone https://github.com/torvalds/linux.git linux-kernel
touch test.log
echo "Hello, world!" > test.log
sleep 10
cat test.log
