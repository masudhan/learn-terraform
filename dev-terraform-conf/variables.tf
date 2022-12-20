# VPC variables
variable "env-prefix" {}
variable "vpc_cidr_block" {}

# Subnet

variable "public_subnet_1_az" {}
variable "public_subnet_1_cidr_block" {}

# Security group variables
variable "security_group_for_jenkins_name" {}
variable "security_group_ingress_1_cidr_block" {}
variable "security_group_ingress_2_cidr_block" {}
variable "security_group_egress_1_cidr_block" {}

# Jenkins instance variables
variable "jenkins_instance_ami" {}
variable "jenkins-instance_associate_public_ip_address" {}
variable "jenkins_instance_az" {}
variable "jenkins_instance_instance_type" {}
