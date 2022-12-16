output "region" {
  value = var.region
}

output "vpc_id" {
  value = aws_vpc.india.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "route_table" {
  value = aws_route_table.public_route_table.id
}


