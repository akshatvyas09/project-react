<<<<<<< HEAD
FROM node:20-alpine AS build
=======
FROM node:22-alpine AS build
>>>>>>> a3d3ef2 (Updated Dockerfile for vite react build)

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
