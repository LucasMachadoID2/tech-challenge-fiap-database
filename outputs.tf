output "users_table_arn" {
  description = "ARN of the Users DynamoDB table"
  value       = aws_dynamodb_table.users.arn
}

output "users_table_name" {
  description = "Name of the Users DynamoDB table"
  value       = aws_dynamodb_table.users.name
}

output "orders_table_arn" {
  description = "ARN of the Orders DynamoDB table"
  value       = aws_dynamodb_table.orders.arn
}

output "orders_table_name" {
  description = "Name of the Orders DynamoDB table"
  value       = aws_dynamodb_table.orders.name
}