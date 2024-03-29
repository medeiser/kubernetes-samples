# Nginx Ingress configuration sample

Sample applications [Parrot](https://github.com/medeiser/parrot) and [Randomizer](https://github.com/medeiser/randomizer) are deployed in the Cluster and an Ingress is configured (path based) for both apps.

## Instalation:

Ingress-NGINX must be installed.

Minikube:

```shell
$ minikube addons enable ingress
```

## *Example:*

This can be done using a local Minikube cluster.

### *Scripts:*

```shell
$ kubectl apply -f parrot-deployment.yaml
$ kubectl apply -f randomizer-deployment.yaml
$ kubectl apply -f ingress-deployment.yaml
```

### *Usage:*

```shell
$ curl -X GET 'http://<minikube_ip>/parrot/tomato'
tomato
```

```shell
$ curl -X GET 'http://<minikube_ip>/random?max=12&min=7'
9
```
