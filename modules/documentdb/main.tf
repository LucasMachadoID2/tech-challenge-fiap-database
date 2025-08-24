resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${var.cluster_identifier}-${var.environment}"
  engine                  = "docdb"
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
  db_subnet_group_name    = aws_docdb_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.main.id]
}

resource "aws_docdb_cluster_instance" "main" {
  count              = var.instance_count
  identifier         = "${var.cluster_identifier}-${var.environment}-${count.index}"
  cluster_identifier = aws_docdb_cluster.main.id
  instance_class     = var.instance_class
}

resource "aws_docdb_subnet_group" "main" {
  name       = "${var.cluster_identifier}-${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.cluster_identifier}-${var.environment}-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "main" {
  name        = "${var.cluster_identifier}-${var.environment}-sg"
  description = "Security group for DocumentDB cluster"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow MongoDB access from allowed CIDRs"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.cluster_identifier}-${var.environment}-sg"
    Environment = var.environment
  }
}