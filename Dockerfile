FROM node:18.12-alpine
RUN apk update
RUN node -c "fetch("http://fmaas-dev-api.bx.cloud9.ibm.com")"
