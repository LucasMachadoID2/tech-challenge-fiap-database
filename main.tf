# Tabela de Usuários
resource "aws_dynamodb_table" "users" {
  name         = "tech-challenge-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "cpf"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "cpf"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name            = "CpfIndex"
    hash_key        = "cpf"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "EmailIndex"
    hash_key        = "email"
    projection_type = "ALL"
  }
}

# Tabela de Pedidos
resource "aws_dynamodb_table" "orders" {
  name         = "tech-challenge-orders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "createdAt"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "cpf"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  global_secondary_index {
    name            = "ByCpf"
    hash_key        = "cpf"
    range_key       = "createdAt"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "ByStatus"
    hash_key        = "status"
    range_key       = "createdAt"
    projection_type = "ALL"
  }
}

# Tabela de Produtos
resource "aws_dynamodb_table" "products" {
  name         = "tech-challenge-products"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "category"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "category"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  global_secondary_index {
    name            = "ByCategory"
    hash_key        = "category"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "ByName"
    hash_key        = "name"
    projection_type = "ALL"
  }
}

# Tabela de Pagamentos
resource "aws_dynamodb_table" "payments" {
  name         = "tech-challenge-payments"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  range_key    = "orderId"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "orderId"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  global_secondary_index {
    name            = "ByOrder"
    hash_key        = "orderId"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "ByStatus"
    hash_key        = "status"
    projection_type = "ALL"
  }
}