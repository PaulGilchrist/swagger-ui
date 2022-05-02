# docker build --rm -f "Dockerfile" --no-cache --platform linux/arm64/v8 -t paulgilchrist/swagger-ui:arm64v8 .
# docker push paulgilchrist/swagger-ui:arm64v8
# docker build --rm -f "Dockerfile" --no-cache --platform linux/amd64 -t paulgilchrist/swagger-ui:amd64 .
# docker push paulgilchrist/swagger-ui:amd64
# docker manifest rm paulgilchrist/swagger-ui:latest
# docker manifest create paulgilchrist/swagger-ui:latest paulgilchrist/swagger-ui:arm64v8 paulgilchrist/swagger-ui:amd64
# docker manifest push paulgilchrist/swagger-ui:latest
FROM nginx:alpine
LABEL author="Paul Gilchrist"
COPY ./src /usr/share/nginx/html
EXPOSE 80 443
# Add bash
RUN apk add --no-cache bash
# Make our shell script executable
RUN chmod +x /usr/share/nginx/html/env.sh
# Start Nginx server
CMD ["/bin/bash", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]

# docker run -d -p 8085:80 paulgilchrist/swagger-ui
# docker rm -f <containerID>
