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

  # ✅ GSI para buscar por CPF
  global_secondary_index {
    name            = "CpfIndex"
    hash_key        = "cpf"
    projection_type = "ALL"
  }

  # ✅ GSI para buscar por Email
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

  # ✅ GSI para buscar pedidos por cliente
  global_secondary_index {
    name            = "ByCpf"
    hash_key        = "cpf"
    range_key       = "createdAt"
    projection_type = "ALL"
  }

  # ✅ GSI para buscar pedidos por status
  global_secondary_index {
    name            = "ByStatus"
    hash_key        = "status"
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
  range_key    = "category" 

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
    name = "status"
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
    hash_key        = "status"
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


