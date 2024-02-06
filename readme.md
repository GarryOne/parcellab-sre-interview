## Introduction

The API was built using [Nest.js](https://github.com/nestjs/nest).

There is a `GET /` endpoint which displays a `SALUTION_TEXT` defined in the ENV.

## Kubernetes configuration
* There is `deployment-a.yaml`. 
* There is `deployment-b.yaml`. 

## Setup



### Minikube

1. Have `minikube installed`. Then run `minikube start`
2. Switch kubectl context to minikube: `kubectl config set current-context minikube`

## Docker Local Registry

3. `minikube addons enable registry`
4. `kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep registry | awk '{print $1}') 5000:5000 &` - this will enable localhost:5000 as the **local docker registry**

## Deploy
5. Run `./docker-push.sh`
6. Run `./deploy-k8s.sh`

Add instructions about port-forward. How to test each service? 


## Test
* `kubectl port-forward svc/nodejs-service-a -n default 8080:80` - http://localhost:8080 - you'll get `Hello Madam`
* `kubectl port-forward svc/nodejs-service-b -n default 8081:80` - http://localhost:8081 - you'll get `Dear Sir`


