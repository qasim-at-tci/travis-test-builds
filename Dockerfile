FROM node:18.12-alpine
RUN apk update
WORKDIR /app/src
COPY testt.js /app/src
CMD ["node", "/app/src/testt.js"]
