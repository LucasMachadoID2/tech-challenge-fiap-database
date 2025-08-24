terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket         = "tech-challenge-tf-state"
    key            = "production/database/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

module "documentdb" {
  source = "../../modules/documentdb"

  environment          = "production"
  cluster_identifier   = "tech-challenge-db"
  master_username      = var.documentdb_master_username
  master_password      = var.documentdb_master_password
  instance_class       = "db.t3.medium"
  instance_count       = 1
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot  = true
  vpc_id               = var.vpc_id
  subnet_ids           = var.subnet_ids
  allowed_cidr_blocks  = var.allowed_cidr_blocks
}