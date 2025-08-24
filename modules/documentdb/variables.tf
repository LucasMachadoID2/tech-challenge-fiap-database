variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_identifier" {
  description = "Identifier for the DocumentDB cluster"
  type        = string
}

variable "master_username" {
  description = "Master username for DocumentDB"
  type        = string
  sensitive   = true
}

variable "master_password" {
  description = "Master password for DocumentDB"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for DocumentDB instances"
  type        = string
  default     = "db.t3.medium"
}

variable "instance_count" {
  description = "Number of DocumentDB instances"
  type        = number
  default     = 1
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "07:00-09:00"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when destroying cluster"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access DocumentDB"
  type        = list(string)
  default     = []
}