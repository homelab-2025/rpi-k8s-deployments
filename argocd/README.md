# ArgoCD installation script

This script installs ArgoCD on already set up RPI4 Kubernetes cluster.
It creates a namespace for ArgoCD, applies the necessary manifests, waits for the pods to be ready, and provides the initial admin password.

### Getting Started

1. Clone the repository or navigate to the directory where this script is located.

2. Make the script executable and run it:

```bash
chmod +x install.sh
```

```bash
./install.sh
```

3. Once the script ends, copy the token provided in the output.

4. Forward port with the printed command:

5. Log in at https://localhost:8080/ using username `admin` and the token as password.