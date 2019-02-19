FROM node:11.9.0 as builder
WORKDIR /builder
COPY . .
RUN npm install
RUN npm run-script build

FROM nginx:1.15.8
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /builder/build /app