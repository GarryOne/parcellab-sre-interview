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
