# private route table 
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.india.id

  tags = {
    Name = var.private_route_table_name
  }
}