# Longhorn installation

To install Longhorn on an already set up Raspberry Pi Kubernetes cluster, you just have to run the following command:

```sh
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.10.0/deploy/longhorn.yaml
```

This will create a namespace called `longhorn-system` and deploy all the necessary components.
After a few minutes, you can check if all the pods are running with:

```sh
kubectl get pods -n longhorn-system
```

You can then access the Longhorn UI by port-forwarding the `longhorn-frontend` service:

```sh
kubectl -n longhorn-system port-forward svc/longhorn-frontend 8080:80
```