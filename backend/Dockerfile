FROM node:16.20-slim

WORKDIR /app

COPY package.json package.json
RUN npm install

COPY . .

CMD node src/index.js