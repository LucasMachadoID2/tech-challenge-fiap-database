output "documentdb_cluster_endpoint" {
  description = "Endpoint of the DocumentDB cluster"
  value       = module.documentdb.cluster_endpoint
}

output "documentdb_cluster_reader_endpoint" {
  description = "Reader endpoint of the DocumentDB cluster"
  value       = module.documentdb.cluster_reader_endpoint
}

output "documentdb_cluster_port" {
  description = "Port of the DocumentDB cluster"
  value       = module.documentdb.cluster_port
}

output "documentdb_cluster_id" {
  description = "ID of the DocumentDB cluster"
  value       = module.documentdb.cluster_id
}

output "documentdb_security_group_id" {
  description = "Security group ID of the DocumentDB cluster"
  value       = module.documentdb.security_group_id
}