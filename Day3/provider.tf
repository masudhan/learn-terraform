terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
  backend "s3" {
    bucket         = "country-prod-remote-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "country-prod-dynamodb-table-lock"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
