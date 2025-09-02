# outputs.tf
output "dynamodb_table_arns" {
  description = "ARNs de todas as tabelas DynamoDB"
  value = {
    users    = aws_dynamodb_table.users.arn
    orders   = aws_dynamodb_table.orders.arn
    products = aws_dynamodb_table.products.arn
    payments = aws_dynamodb_table.payments.arn
  }
}

output "dynamodb_table_names" {
  description = "Nomes de todas as tabelas DynamoDB"
  value = {
    users    = aws_dynamodb_table.users.name
    orders   = aws_dynamodb_table.orders.name
    products = aws_dynamodb_table.products.name
    payments = aws_dynamodb_table.payments.name
  }
}