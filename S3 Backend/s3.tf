resource "aws_s3_bucket" "country-prod-remote-state-bucket" {
  bucket = "country-prod-remote-state-bucket"

  tags = {
    Name        = "country-prod-remote-state-bucket"
    Environment = "prod"
    Owner       = "Country"
  }
}