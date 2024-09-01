# AKS Deployment with Terraform

This project provides a Terraform configuration for deploying an Azure Kubernetes Service (AKS) cluster. The deployed cluster will run a container application that prints its IPv4 address and version.

## Prerequisites

- **Terraform**: Make sure Terraform is installed on your local machine. [Install Terraform](https://www.terraform.io/downloads.html)
- **Azure CLI**: You need the Azure CLI installed to interact with Azure resources. [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- **Azure Subscription**: You must have an active Azure subscription. The Subscription ID should be provided.

## Setup and Deployment

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
``` 

### 2. Initialize Terraform

Initialize the Terraform working directory by downloading the necessary providers.

```bash
terraform init
```

### 3. Configure the Environment Variables

Set up the environment variables for your Azure subscription. This project uses a Managed Identity, so only the ARM_SUBSCRIPTION_ID is required.
```bash
export ARM_SUBSCRIPTION_ID=<your_subscription_id>
``` 

### 4. Deploy the Infrastructure

To deploy the AKS cluster and related resources, run:
```bash
terraform apply
```
	•	Note: You will be prompted to confirm the deployment. Type yes and press Enter.

### 5. Retrieve the kubeconfig

After the deployment is complete, you need to retrieve the kubeconfig file to access the AKS cluster:
```bash
az aks get-credentials --resource-group <resource_group_name> --name <cluster_name>
``` 
Replace <resource_group_name> with the name of your resource group and <cluster_name> with the name of your AKS cluster.

### 6. Verify the Cluster Access

You can verify that you have access to the cluster by running:
```bash
kubectl get nodes
```
This command should return a list of nodes in the AKS cluster.

### Clean Up

To destroy all the resources created by Terraform, run:
```bash
terraform destroy
```  

•	Note: You will be prompted to confirm the destruction. Type yes and press Enter.

## Troubleshooting

•	Error: SKU Not Available: If you encounter an error related to SKU availability, either change the VM size in the main.tf file or choose a different region.  
•	Authentication Issues: Ensure that the environment variable ARM_SUBSCRIPTION_ID is correctly set.
