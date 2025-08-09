# Kubernetes Dashboard installation script

This script installs the Kubernetes Dashboard on an already set up Raspberry Pi Kubernetes cluster. It creates a namespace for the dashboard, applies the necessary manifests, waits for the pods to be ready, and provides an admin token for access.

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

5. Log in at https://localhost:8443/ and paste the token.