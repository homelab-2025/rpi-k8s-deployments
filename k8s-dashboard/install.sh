#!/bin/bash
set -e

echo "Creating namespace kubernetes-dashboard..."
kubectl create namespace kubernetes-dashboard --dry-run=client -o yaml | kubectl apply -f -

echo "Starting Kubernetes Dashboard deployment..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

echo "⏳ Waiting for Kubernetes Dashboard to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment --all -n kubernetes-dashboard
echo "✅ Kubernetes Dashboard is ready!"

echo "Creating admin user and binding..."
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

echo "🔑 Admin token for Kubernetes Dashboard:"
kubectl -n kubernetes-dashboard create token admin-user

echo "Kubernetes Dashboard is now installed and running in the 'kubernetes-dashboard' namespace."
echo "You can access the Kubernetes Dashboard UI using the following command to port-forward the service:"
echo "kubectl port-forward svc/kubernetes-dashboard -n kubernetes-dashboard 8443:443"