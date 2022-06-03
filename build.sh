#!/bin/sh
echo "$(tput setaf 2)"
echo "Building paulgilchrist/swagger-ui:arm64v8"
echo "$(tput setaf 7)"
docker build --rm -f "Dockerfile" --no-cache --platform linux/arm64 -t paulgilchrist/swagger-ui:arm64v8 .
echo "$(tput setaf 2)"
echo "Pushing paulgilchrist/swagger-ui:arm64v8 to https://hub.docker.com"
echo "$(tput setaf 7)"
docker push paulgilchrist/swagger-ui:arm64v8
echo "$(tput setaf 2)"
echo "Building paulgilchrist/swagger-ui:arm64v8"
echo "$(tput setaf 7)"
docker build --rm -f "Dockerfile" --no-cache --platform linux/amd64 -t paulgilchrist/swagger-ui:arm64v8 .
echo "$(tput setaf 2)"
echo "Pushing paulgilchrist/swagger-ui:arm64v8 to https://hub.docker.com"
echo "$(tput setaf 7)"
docker push paulgilchrist/swagger-ui:arm64v8
echo "$(tput setaf 2)"
echo "Removing paulgilchrist/swagger-ui:latest manifest"
echo "$(tput setaf 7)"
docker manifest rm paulgilchrist/swagger-ui:latest
echo "$(tput setaf 2)"
echo "Creating paulgilchrist/swagger-ui:latest manifest"
echo "$(tput setaf 7)"
docker manifest create paulgilchrist/swagger-ui:latest paulgilchrist/swagger-ui:arm64v8 paulgilchrist/swagger-ui:amd64
echo "$(tput setaf 2)"
echo "Pushing paulgilchrist/swagger-ui:latest manifest to https://hub.docker.com"
echo "$(tput setaf 7)"
docker manifest push paulgilchrist/swagger-ui:latest
echo "$(tput setaf 2)"
echo "Build complete"
echo "Don't forget to update Kubernetes. For example:"
echo "$(tput setaf 3)"
echo "    kubectl rollout restart deployment registry -n demo"
echo "$(tput setaf 7)"
