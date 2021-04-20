FROM node:alpine as builder
WORKDIR /new-react-app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /new-react-app/build /usr/share/nginx/html

