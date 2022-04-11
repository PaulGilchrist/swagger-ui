# docker build --rm -f "Dockerfile" -t paulgilchrist/swagger-ui:latest .
# docker push paulgilchrist/swagger-ui
FROM --platform=linux/amd64 nginx:alpine
LABEL author="Paul Gilchrist"
COPY ./src /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
# docker run -d -p 8085:80 paulgilchrist/swagger-ui
# docker rm -f <containerID>
