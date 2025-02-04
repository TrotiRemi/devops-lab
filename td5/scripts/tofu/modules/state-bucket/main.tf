resource "aws_s3_bucket" "tofu_state" {  # Le nom ici doit correspondre à outputs.tf
  bucket = var.name
}

resource "aws_dynamodb_table" "tofu_locks" {  # Le nom ici doit correspondre à outputs.tf
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}