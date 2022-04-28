# docker build --rm -f "Dockerfile" --platform linux/arm64/v8 -t paulgilchrist/swagger-ui:arm64v8-1.0.0 .
# docker push paulgilchrist/swagger-ui:arm64v8-1.0.0
# docker build --rm -f "Dockerfile" --platform linux/amd64 -t paulgilchrist/swagger-ui:amd64-1.0.0 .
# docker push paulgilchrist/swagger-ui:amd64-1.0.0
# docker manifest create --amend paulgilchrist/swagger-ui:1.0.0 paulgilchrist/swagger-ui:arm64v8-1.0.0 paulgilchrist/swagger-ui:amd64-1.0.0
# docker push paulgilchrist/swagger-ui:1.0.0
FROM nginx:alpine
LABEL author="Paul Gilchrist"
COPY ./src /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
# docker run -d -p 8085:80 paulgilchrist/swagger-ui
# docker rm -f <containerID>
