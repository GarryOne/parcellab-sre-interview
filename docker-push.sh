#!/bin/bash

APP_NAME="nodejs-app"
IMAGE_TAG="latest"
LOCAL_REGISTRY="localhost:5000"

docker build -t ${APP_NAME}:${IMAGE_TAG} .

docker tag ${APP_NAME}:${IMAGE_TAG} ${LOCAL_REGISTRY}/${APP_NAME}:${IMAGE_TAG}

docker push ${LOCAL_REGISTRY}/${APP_NAME}:${IMAGE_TAG}

echo "Image ${APP_NAME}:${IMAGE_TAG} pushed to ${LOCAL_REGISTRY}"
