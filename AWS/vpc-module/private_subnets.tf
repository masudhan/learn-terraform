# private subnet 1  
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.india.id
  cidr_block = var.private_subnet_1_cidr_block
  availability_zone = var.private_subnet_1_availability_zone
  tags = {
    Name = var.private_subnet_1_name
  }
}