# docker build --rm -f "Dockerfile" -t paulgilchrist/swagger-ui:arm64 .
# docker push paulgilchrist/swagger-ui:arm64
# docker build --rm -f "Dockerfile" --platform linux/amd64 -t paulgilchrist/swagger-ui:amd64 .
# docker push paulgilchrist/swagger-ui:amd64
# docker manifest create paulgilchrist/swagger-ui:latest paulgilchrist/swagger-ui:arm64 paulgilchrist/swagger-ui:amd64
# docker manifest push paulgilchrist/swagger-ui:latest
FROM nginx:alpine
LABEL author="Paul Gilchrist"
COPY ./src /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
# docker run -d -p 8085:80 paulgilchrist/swagger-ui
# docker rm -f <containerID>
