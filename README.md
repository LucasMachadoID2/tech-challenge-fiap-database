# Terraform AWS Database Infrastructure

This repository contains Terraform code to provision Amazon DocumentDB (MongoDB compatible) for the Tech Challenge application.

## Architecture

- Amazon DocumentDB cluster with 1 instance (configurable)
- Security group allowing access from specified CIDR blocks
- Automated backups with 7-day retention
- VPC deployment with private subnets

## Prerequisites

- Terraform >= 1.0.0
- AWS account with appropriate permissions
- Existing VPC and subnets

## Setup

1. Clone the repository
2. Configure AWS credentials
3. Update variables in `environments/prod/terraform.tfvars`
4. Set secrets in GitHub:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `DOCUMENTDB_MASTER_USERNAME`
   - `DOCUMENTDB_MASTER_PASSWORD`

## Usage

### Manual deployment
```bash
cd environments/prod
terraform init
terraform plan
terraform apply