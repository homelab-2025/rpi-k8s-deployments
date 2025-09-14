# Loki Stack on ArgoCD

To deploy the Loki Stack on Kubernetes, you can use the ArgoCD CLI.

### Prerequisites
- Access to the Kubernetes cluster with ArgoCD installed
- ArgoCD CLI installed

### Deploying with ArgoCD

1. Create an ArgoCD application:

```bash
argocd app create loki-stack \
  --repo https://grafana.github.io/helm-charts \
  --helm-chart loki-stack \
  --revision 2.10.2 \
  --dest-namespace monitoring \
  --dest-server https://kubernetes.default.svc \
  --sync-policy auto \
  --sync-option CreateNamespace=true \
  --helm-set test_pod.enabled=false \
  --helm-set grafana.enabled=true
```

2. Retrieve the Grafana admin password:

```bash
kubectl get secret -n monitoring loki-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode; echo
```

3. Port-forward to access the Grafana UI:

```bash
kubectl port-forward -n monitoring svc/loki-stack-grafana 3000:80
```

4. Access Grafana at `http://localhost:3000` and log in with username `admin` and the password retrieved in step 2.

### Cleanup

To delete the application, run the following command:

```bash
argocd app delete loki-stack
```