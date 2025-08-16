# simple-api

To deploy the simple API on Kubernetes, you can use either ArgoCD CLI.

### Prerequisites

- Access to the Kubernetes cluster with ArgoCD installed
- ArgoCD CLI installed

### Deploying with ArgoCD

1. Create an ArgoCD application:

```bash
argocd app create simple-api  \
  --repo https://github.com/homelab-2025/simple-api-deploy-k8s.git \
  --path chart \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace app
```

Remark: if you want to use it with hpa, you can execute the following command:

```bash
argocd app set simple-api --helm-set autoscaling.enabled=true
```

2. Sync the application:

```bash
argocd app sync simple-api
```

### Cleanup

To delete the application, run the following command:

```bash
argocd app delete simple-api
```