resource "aws_dynamodb_table" "country-prod-dynamodb-table-lock" {
  name           = "country-prod-dynamodb-table-lock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "country-prod-dynamodb-table-lock"
    Environment = "prod"
    Owner       = "Country"
  }
}