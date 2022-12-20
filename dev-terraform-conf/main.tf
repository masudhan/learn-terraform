# S3 Backend
terraform {
  required_version = ">= 0.12"
  backend "s3" {
    # Create S3 bucked and block all public access
    bucket = "dev-terraform-state"
    key = "terraform/dev-terraform.tfstate"
    region = "ap-south-1"
  }
}

# VPC Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.env-prefix
  cidr = var.vpc_cidr_block

  azs             = [var.public_subnet_1_az]
  public_subnets  = [var.public_subnet_1_cidr_block]
  public_subnet_tags = {Name: "${var.env-prefix}-public-subnet-1"}

  tags = {
    Name: "${var.env-prefix}"
  }
}

# Custom jenkins module
module "jenkins-server" {
  source = "./modules/jenkins-server"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets[0]
  jenkins_instance_ami = var.jenkins_instance_ami
  jenkins-instance_associate_public_ip_address = var.jenkins-instance_associate_public_ip_address
  jenkins_instance_az = var.jenkins_instance_az
  jenkins_instance_instance_type = var.jenkins_instance_instance_type
  security_group_egress_1_cidr_block = var.security_group_egress_1_cidr_block
  security_group_for_jenkins_name = var.security_group_for_jenkins_name
  security_group_ingress_1_cidr_block = var.security_group_ingress_1_cidr_block
  security_group_ingress_2_cidr_block = var.security_group_ingress_2_cidr_block
  env-prefix = var.env-prefix
}
