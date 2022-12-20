variable "env-prefix" {}
variable "vpc_id" {}

variable "security_group_for_jenkins_name" {}
variable "security_group_ingress_1_cidr_block" {}
variable "security_group_ingress_2_cidr_block" {}
variable "security_group_egress_1_cidr_block" {}

variable "jenkins_instance_ami" {}
variable "jenkins_instance_instance_type" {}
variable "subnet_id" {}
variable "jenkins_instance_az" {}
variable "jenkins-instance_associate_public_ip_address" {}
