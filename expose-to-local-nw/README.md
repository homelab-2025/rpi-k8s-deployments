# Local network exposure

If you want to expose your services to your local network, you can use the following commands to create a node port for each service and then you need to allow traffic to the node port in your firewall.

```sh
kubectl -n kubernetes-dashboard patch svc kubernetes-dashboard -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n kubernetes-dashboard kubernetes-dashboard
```

```sh
kubectl -n argocd patch svc argocd-server -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n argocd argocd-server
```

```sh
kubectl -n longhorn-system patch svc longhorn-frontend -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n longhorn-system longhorn-frontend
```

