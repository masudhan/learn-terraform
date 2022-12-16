# public subnet 1  
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.india.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = var.public_subnet_1_availability_zone
  tags = {
    Name = var.public_subnet_1_name
  }
}