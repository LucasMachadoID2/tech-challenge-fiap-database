output "cluster_endpoint" {
  description = "Endpoint of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.endpoint
}

output "cluster_reader_endpoint" {
  description = "Reader endpoint of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.reader_endpoint
}

output "cluster_port" {
  description = "Port of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.port
}

output "cluster_id" {
  description = "ID of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.id
}

output "security_group_id" {
  description = "Security group ID of the DocumentDB cluster"
  value       = aws_security_group.main.id
}