FROM node:lts-alpine as build-stage

WORKDIR /app
COPY . .

ENV NODE_ENV=production
ENV PORT=3000

VOLUME ["/app"]

RUN npm install
EXPOSE $PORT

ENTRYPOINT [ "npx", "pm2-runtime", "start", "ecosystem.config.js" ]