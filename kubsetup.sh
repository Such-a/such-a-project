#!/bin/bash
set -e

echo "===== Installing kubectl ====="

# Download latest kubectl
K8S_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${K8S_VERSION}/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/${K8S_VERSION}/bin/linux/amd64/kubectl.sha256"

# Verify checksum
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Cleanup
rm -f kubectl kubectl.sha256

# Verify kubectl
kubectl version --client

echo "===== kubectl installed successfully ====="
echo

echo "===== Installing Helm ====="

# Download Helm installer
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh

# Install Helm
./get_helm.sh

# Cleanup
rm -f get_helm.sh

# Verify Helm
helm version

echo "===== Helm installed successfully ====="
echo

echo "===== Installing RKE ====="

# Download latest RKE (amd64)
curl -s https://api.github.com/repos/rancher/rke/releases/latest \
  | grep download_url \
  | grep linux-amd64 \
  | cut -d '"' -f 4 \
  | wget -qi -

# Make executable and move to PATH
chmod +x rke_linux-amd64
sudo mv rke_linux-amd64 /usr/local/bin/rke

# Verify RKE
rke --version

echo "===== RKE installed successfully ====="
echo
echo "All management tools installed successfully 🚀"
