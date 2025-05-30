## 📌 Overview
This solution provisions a secure and scalable Wazuh monitoring stack using AWS and Docker Compose. All infrastructure is defined using Terraform.

## 🚀 Setup Instructions
1. Configure AWS CLI

aws configure

2. Initialize Terraform & Apply

cd terraform
terraform init
terraform plan 
terraform apply

## 🔐 Access
- EC2 instance is placed in a **private subnet**.
- Use **AWS Systems Manager (SSM)** to access EC2:

aws ssm start-session --target <instance-id>


## 🔒 Security Considerations
- All resources are **tagged** with project metadata.
- EC2 is not publicly accessible.
- Egress is restricted to HTTPS.
- IAM role limited to **SSM and CloudWatch Logs**.
- Docker Compose uses `depends_on` for startup order.

## 🚧 Assumptions
- Terraform backend S3 bucket is created by Terraform itself.
- Using **Amazon Linux 2** with latest Docker/Docker Compose versions.

## 🔀 Cleanup

terraform destroy -auto-approve
