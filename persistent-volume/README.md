# PersistentVolume configuration sample

An application that persists data shows how a volume can be mounted locally using Minikube.

## *Building the App:*

Docker may need to be configured to use Minikube VM in order to have the images built in it and thus be easily accessed.

```shell
$ eval "$(minikube docker-env)"
```

Build the image:

```shell
$ docker build -t heartbeat-app ./app
```

## *Setup Minikube:*

The local path must be mounted inside Minikube's VM:

```shell
$ minikube mount $HOME/volumes:/data &
```

## *Deploying:*

```shell
$ kubectl apply -f heartbeat-volume.yaml
$ kubectl apply -f heartbeat-deployment.yaml
```

## *Usage:*

The log for the running pod can be viewed through *minikube's dashboard* and the local mount should be played with.
