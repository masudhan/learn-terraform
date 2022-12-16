# Internet gateway
resource "aws_internet_gateway" "india_internet_gateway" {
  vpc_id = aws_vpc.india.id
  tags = {
    Name : var.india_igw_name
  }
}