# GitOps Pipeline with Argo CD and Argo Rollouts

This repository contains the setup and implementation of a GitOps pipeline using Argo CD for continuous deployment and Argo Rollouts for canary releases in a Kubernetes cluster.

I also created a video for this assignment => [Video](https://www.youtube.com/watch?v=kw2anbSCK2s&ab_channel=Mohit%27sCloudRealm)


## Task 1: Setup and Configuration

### Create a GitHub Repository
- Created a GitHub repository to host the source code and Kubernetes manifests name ArgoCD-project.

### Create Dockerfile
- Created a Dockerfile to build the docker image for the Webapp.

### Manifests file for the Cluster
- I have added 2 manifests files.

### GitHub Actions workflow
- Created a GitHub actions workflow do to the continous integration part.
- Built a Docker image for the web application.
- Pushed the Docker image to DockerHub.
- Update the manifest file with the new image

### Kubernetes Cluster Setup
- I have used minikube for this project, where we had 1 node (control plane)

### Install Argo CD
- Followed the official Argo CD documentation to install and set up Argo CD in the Kubernetes cluster.


## Task 2: Deploying with GitOps Pipeline

### Deploy the Application Using Argo CD
- Modified the Kubernetes manifests in the repository to utilize the Docker image.
- Configured Argo CD to monitor the repository and automatically deploy changes to the Kubernetes cluster.

## Task 3: Install Argo Rollouts and Implementing a Canary Release

### Install Argo Rollouts
- Installed the Argo Rollouts controller in the Kubernetes cluster as per the official guide.

### Define a Rollout Strategy
- Modified the deployment.yaml file to Argo Rollouts kind.
- Specified a canary release strategy in the rollout definition.

### Trigger a Rollout
- Made changes to the application, updated the Docker image, and pushed the new version to the registry.
- Updated the rollout definition to use the new image with Github actions.

### Monitor the Rollout
- Utilized Argo Rollouts Dashboard to monitor the deployment of the new version, ensuring the canary release successfully completed.

## Repository Structure

- `.github/workflows/argocicd.yaml` : Github action workflow file
- `manifests/`: Contains Kubernetes manifests for deploying the application.
- `Dockerfile`: Dockerfile for building the application Docker image.
- `README.md`: Documentation explaining the setup and implementation of the GitOps pipeline.

## Clean Up
To cleanly remove all resources created during this assignment from the Kubernetes cluster, follow these steps:
1. Delete the Argo CD installation using the following command:
   ```bash
   kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
2. Now delete the namespace with the command:
   ```bash
   kubectl delete ns argocd
3. Delete the Argo Rollout installation using the following command:
   ```bash
   kubectl delete -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
4. Now delete the namespace with the command:
   ```bash
   kubectl delete ns argo-rollouts
5. Now delete the Webapp namespace that we have created whil add application in argo dashboard
   ```bash
   kubectl delete ns webapp