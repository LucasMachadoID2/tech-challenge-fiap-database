variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "documentdb_master_username" {
  description = "Master username for DocumentDB"
  type        = string
  sensitive   = true
}

variable "documentdb_master_password" {
  description = "Master password for DocumentDB"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID where DocumentDB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for DocumentDB subnet group"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access DocumentDB"
  type        = list(string)
  default     = []
}