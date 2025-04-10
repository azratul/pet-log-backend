# FROM node:16 as builder
#
# WORKDIR /app
#
# COPY package*.json ./
#
# RUN npm install
#
# COPY . .
#
# ENTRYPOINT ["npm"]
# CMD ["run", "dev"]
#
FROM node:18-alpine AS deps

WORKDIR /app

COPY package*.json ./

RUN npm install

FROM node:18-alpine

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
