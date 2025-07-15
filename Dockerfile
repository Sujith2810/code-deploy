FROM nginx:alpine

docker build -t myapp .

COPY index.html /usr/share/nginx/html/index.html
