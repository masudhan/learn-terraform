# VPC
variable "country-prod-vpc-cidr" {
  type = string
  #   default = "192.0.0.0/16" # if we don't define this then terraform will ask us during runtime, like `terraform apply -var "country-prod-vpc-cidr=192.0.0.0/16"` or use terraform.tfvars
}

variable "country-prod-vpc-enable_dns_support" {
  type = bool
}

variable "country-prod-default-tags" {
  type = map(any)
}

# Public subnet
variable "country-prod-public-subnet-1-cidr" {
  type = string
}

variable "country-prod-public-subnet-1-availability_zone" {
  type = string
}

# Private subnet
variable "country-prod-private-subnet-1-cidr" {
  type = string
}

variable "country-prod-private-subnet-1-availability_zone" {
  type = string
}

# Public route table
variable "country-prod-public-route-table-1-cidr" {
  type = string
}

# Private route table
variable "country-prod-private-route-table-1-cidr" {
  type = string

}
