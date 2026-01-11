# Kubernetes Cluster Deployment on AWS

## Overview
Fully automated deployment of a multi-node Kubernetes cluster on AWS with Terraform, Ansible, and RKE, featuring a stateful frontend-backend application with persistent storage.

## Architecture
- **Management node**: Installs kubectl, Helm, RKE.
- **Master nodes**: Kubernetes control plane.
- **Worker nodes**: Runs application pods.
- **Frontend**: Nginx serving HTML with live request counter.
- **Backend**: Flask API storing request logs on AWS EFS.

## Features
- IaC with Terraform
- Docker installation via Ansible
- Kubernetes cluster management with RKE
- Persistent backend data on AWS EFS
- NodePort services for frontend and backend
- Automatic request counting and logging

## Tech Stack
- AWS: EC2, VPC, Subnet, Security Groups, EFS
- Terraform, Ansible, Bash scripting
- Kubernetes: Deployments, Services, PV/PVC
- Flask (Python), Nginx
- Docker, Helm, kubectl, RKE

## How to Use
1. Run Terraform to provision AWS infrastructure.
2. Use Ansible to install Docker on all nodes.
3. Run `kubesetup.sh` on management node to install kubectl, Helm, RKE.
4. Deploy Kubernetes manifests to set up frontend and backend applications.
5. Access frontend at `http://<NODE-PUBLIC-IP>:30080` and click “Call Backend” to see live stats.

## Result
- Multi-node Kubernetes cluster running on AWS.
- Frontend-backend application functional with request logging.
- Persistent storage ensures logs survive pod restarts.
- Demonstrates automated DevOps workflow from infrastructure to application deployment.
