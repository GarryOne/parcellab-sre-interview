#!/bin/bash

# Deploy the first configuration
kubectl apply -f deployment-a.yaml
kubectl apply -f deployment-b.yaml

kubectl rollout restart deployment/nodejs-app-a
kubectl rollout restart deployment/nodejs-app-b

echo "Deployments have been applied to the Kubernetes cluster."
