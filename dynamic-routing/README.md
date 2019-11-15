# Ambassador configuration sample

Sample applications [Parrot](https://github.com/medeiser/parrot) and [Randomizer](https://github.com/medeiser/randomizer) are deployed dynamically using a template in combination with [Ambassador](https://www.getambassador.io/).

## Installation

```shell
$ kubectl apply -f https://getambassador.io/yaml/ambassador/ambassador-rbac.yaml
```

## *Example:*

This can be done using a local Minikube cluster.

### *Scripts:*

A scriot for using deploying the service using a predefined template was created:

```shell
$ ./deploy-app.sh <app-name> <app-port>
```

Deploy services:

```shell
$ kubectl apply -f ambassador-deployment.yaml
$ ./deploy-app.sh parrot 3000
$ ./deploy-app.sh randomizer 3000
```

### *Usage:*

Minikube tunneling must be enabled in order to access to the *Loadbalancer*.

```shell
$ minikube tunnel
```

Get *Loadbalancer* external IP:

```shell
$ kubectl get services
NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)          AGE
ambassador           LoadBalancer   10.102.29.151    10.102.29.151   80:30979/TCP     18h
ambassador-admin     NodePort       10.111.191.211   <none>          8877:30404/TCP   18h
kubernetes           ClusterIP      10.96.0.1        <none>          443/TCP          18h
parrot-service       ClusterIP      10.102.226.156   <none>          3000/TCP         17h
randomizer-service   ClusterIP      10.108.77.37     <none>          3000/TCP         18h
```

Access the services:

```shell
$ curl -X GET 'http://10.102.29.151/parrot/parrot/cabbage'
cabbage
```

```shell
$ curl -X GET 'http://10.102.29.151/randomizer/random'
2825021391833208
```
