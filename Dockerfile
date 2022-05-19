FROM node:14
WORKDIR /app
COPY package*.json index.js ./
RUN npm -v
RUN npm install
EXPOSE 3000
CMD ["node", "index.js"]