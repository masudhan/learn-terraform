output "vpc-id" {
  value = module.vpc.vpc_id

}

output "vpc-public-subnet-id-1" {
  value = module.vpc.public_subnets[0]
}