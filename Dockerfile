FROM node:alpine as builder
WORKDIR /srv

COPY package.json .
RUN npm install

COPY public ./public
COPY src ./src

RUN npm run build

FROM nginx
COPY --from=builder /srv/build /usr/share/nginx/html
