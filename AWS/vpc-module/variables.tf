# Types can be
# 1. string
# 2. number
# 3. bool
# 4. list(<TYPE>)
# 5. set(<TYPE>)
# 6. map(<TYPE>)
# 7. object({<ATTR NAME> = <TYPE>, ... })
# 8. tuple([<TYPE>, ...])country

variable "vpc_name" {
  description = "VPC Name"
  type        = string

}

variable "is_dns_hostname_enabled" {
  description = "enable_dns_hostnames"
  type = bool
  
}

variable "region" {
  description = "Region"
  type        = string
}

variable "cidr_block" {
  description = "cidr range"
  type        = string

}

variable "public_subnet_1_cidr_block" {
  description = "public subnet_1"
  type        = string
}

variable "public_subnet_1_availability_zone" {
  description = "public subnet 1 availability zone"
  type = string
}

variable "public_subnet_1_name" {
  description = "india_public subnet_1"
  type        = string
}

variable "private_subnet_1_cidr_block" {
  description = "private subnet_1"
  type        = string
}

variable "private_subnet_1_availability_zone" {
  description = "private subnet 1 availability zone"
  type = string
}

variable "private_subnet_1_name" {
  description = "india_private subnet_1"
  type        = string
}

variable "public_route_table_name" {
  description = "public_route_table_name"
  type        = string
}

variable "private_route_table_name" {
  description = "public_route_table_name"
  type        = string
}


variable "india_igw_name" {
  description = "india internet gateway name"
  type        = string
}

variable "igw_cidr_block" {
  description = "internet gateway cidr block"
  type        = string
}
