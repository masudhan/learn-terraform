# Types can be
# 1. string
# 2. number
# 3. bool
# 4. list(<TYPE>)
# 5. set(<TYPE>)
# 6. map(<TYPE>)
# 7. object({<ATTR NAME> = <TYPE>, ... })
# 8. tuple([<TYPE>, ...])country

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type = string
}

variable "vpc_cidr" {
  description = "vpc cidr block"
  type = string
  
}

variable "private_subnet_cidr" {
  description = "private subnet cidr range"
  type = list(string)
}

variable "public_subnet_cidr" {
  description = "public subnet cidr range"
  type = list(string)
}

variable "cluster_version" {
  description = "eks cluster version"
  type = string
}

variable "node_group_1_name" {
  description = "node/worker group 1 name"
  type = string
}

variable "instance_types" {
  description = "eks cluster instance type"
  type = list(string)
}

variable "ami_type" {
  description = "AMI type"
  type = string
}

variable "attach_cluster_primary_security_group" {
  description = "attach_cluster_primary_security_group"
  type = bool
}

variable "create_default_security_group" {
  description = "create default security group"
  type = bool
}

variable "worker_node_1_minimum_instances" {
  description = "worker node 1 number of minimum instances"
  type = number
}

variable "worker_node_1_maximum_instances" {
  description = "worker node 1 number of maximum instances"
  type = number
}

variable "worker_node_1_desired_instances" {
  description = "worker node 1 number of desired instances"
  type = number
}

variable "enable_nat_gateway" {
  description = "enable nat gateway"
  type = bool
}

variable "single_nat_gateway" {
  description = "create only one nat gateway"
  type = bool
}

variable "enable_dns_hostnames" {
  description = "enable dns resolution"
  type = bool
}
