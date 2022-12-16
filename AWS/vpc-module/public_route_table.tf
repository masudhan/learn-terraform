# public route table 
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.india.id
  route {
    cidr_block = var.igw_cidr_block
    gateway_id = aws_internet_gateway.india_internet_gateway.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}