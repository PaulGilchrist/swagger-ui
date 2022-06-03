# bash build.sh
# kubectl rollout restart deployment registry -n demo
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
