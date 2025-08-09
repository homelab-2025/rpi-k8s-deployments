#!/bin/bash

set -e

echo "Creating namespace argocd..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -

echo "starting ArgoCD deployment..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "⏳ Waiting for Argo CD pods to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment --all -n argocd
echo "✅ ArgoCD is ready!"

echo "🔑 Initial admin password:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo

echo "Argo CD is now installed and running in the 'argocd' namespace. You can access the Argo CD UI using the following command to port-forward the service:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"