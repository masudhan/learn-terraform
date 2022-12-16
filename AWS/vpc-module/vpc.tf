# VPC resource 
resource "aws_vpc" "india" {
  tags = {
    Name : var.vpc_name
  }
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.is_dns_hostname_enabled
}



