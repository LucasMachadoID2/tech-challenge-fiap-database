
resource "aws_dynamodb_table" "users" {
  name         = "tech-challenge-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

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

  tags = {
    Project = "tech-challenge"
  }
}

resource "aws_dynamodb_table" "orders" {
  name         = "tech-challenge-orders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "clientId"
    type = "S"
  }

  attribute {
    name = "order_status"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  # ✅ GSI para buscar pedidos por cliente
  global_secondary_index {
    name            = "orders_by_client"
    hash_key        = "clientId"
    range_key       = "createdAt"
    projection_type = "ALL"
  }

  # ✅ GSI para buscar pedidos por status
  global_secondary_index {
    name            = "ByStatus"
    hash_key        = "order_status"
    range_key       = "createdAt"
    projection_type = "ALL"
  }

  tags = {
    Project = "tech-challenge"
  }
}

resource "aws_dynamodb_table" "products" {
  name         = "tech-challenge-products"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "category"
    type = "S"
  }

  attribute {
    name = "price"
    type = "N"
  }

  # Novo atributo para o GSI de promoção
  attribute {
    name = "hasPromotion"
    type = "S"  # ou "N" se preferir 0/1
  }

  # ✅ GSI para buscar produtos por categoria
  global_secondary_index {
    name            = "ByCategory"
    hash_key        = "category"
    range_key       = "price"
    projection_type = "ALL"
  }

  # ✅ GSI para buscar produtos por nome (busca textual)
  global_secondary_index {
    name            = "ByName"
    hash_key        = "name"
    projection_type = "ALL"
  }

  # ✅ GSI para produtos em promoção
  global_secondary_index {
    name            = "ByPromotion"
    hash_key        = "hasPromotion"
    range_key       = "price"
    projection_type = "ALL"
  }

  tags = {
    Project = "tech-challenge"
  }
}

resource "aws_dynamodb_table" "payments" {
  name         = "tech-challenge-payments"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  # Atributos da tabela
  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "payment_status"
    type = "S"
  }

  attribute {
    name = "qrCode"
    type = "S"
  }

  attribute {
    name = "qrImage"
    type = "S"
  }

  # GSI para buscar pagamentos por status
  global_secondary_index {
    name            = "ByStatus"
    hash_key        = "payment_status"
    projection_type = "ALL"
  }

  # GSI para buscar pagamentos por qrCode
  global_secondary_index {
    name            = "ByQrCode"
    hash_key        = "qrCode"
    projection_type = "ALL"
  }

  # GSI para buscar pagamentos por qrImage
  global_secondary_index {
    name            = "ByQrImage"
    hash_key        = "qrImage"
    projection_type = "ALL"
  }

  tags = {
    Project = "tech-challenge"
  }
}


