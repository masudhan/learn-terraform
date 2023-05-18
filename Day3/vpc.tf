# Create VPC with cidr
resource "aws_vpc" "country-prod-vpc" {
  cidr_block         = var.country-prod-vpc-cidr
  enable_dns_support = var.country-prod-vpc-enable_dns_support
  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-vpc"
  })
}

# Create public and private subnets
resource "aws_subnet" "country-prod-public-subnet-1" {
  vpc_id            = aws_vpc.country-prod-vpc.id
  cidr_block        = var.country-prod-public-subnet-1-cidr
  availability_zone = var.country-prod-public-subnet-1-availability_zone
  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-public-subnet-1"
  })
}

resource "aws_subnet" "country-prod-private-subnet-1" {
  vpc_id            = aws_vpc.country-prod-vpc.id
  cidr_block        = var.country-prod-private-subnet-1-cidr
  availability_zone = var.country-prod-private-subnet-1-availability_zone
  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-private-subnet-1"
  })
}

# Create internet gateway to access the internet for the resources deployed in public subnet
resource "aws_internet_gateway" "country-prod-internet-gateway-1" {
  vpc_id = aws_vpc.country-prod-vpc.id
  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-internet-gateway-1"
  })
}

# Create public route table
resource "aws_route_table" "country-prod-public-route-table-1" {
  vpc_id = aws_vpc.country-prod-vpc.id

  route {
    cidr_block = var.country-prod-public-route-table-1-cidr
    gateway_id = aws_internet_gateway.country-prod-internet-gateway-1.id
  }

  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-public-route-table-1"
  })
}

# Private route table depends on NAT Gateway and this depends on elastic IP
# Create elastic ip
resource "aws_eip" "country-prod-elastic-ip-1" {
  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-elastic-ip-1"
  })
}

resource "aws_nat_gateway" "country-prod-nat-gateway-1" {
  allocation_id = aws_eip.country-prod-elastic-ip-1.id
  subnet_id     = aws_subnet.country-prod-public-subnet-1.id

  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-nat-gateway-1"
  })

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.country-prod-internet-gateway-1]
}

# Create private route table
resource "aws_route_table" "country-prod-private-route-table-1" {
  vpc_id = aws_vpc.country-prod-vpc.id

  route {
    cidr_block     = var.country-prod-private-subnet-1-cidr
    nat_gateway_id = aws_nat_gateway.country-prod-nat-gateway-1.id
  }

  tags = merge(var.country-prod-default-tags, {
    Name = "country-prod-private-route-table-1"
  })

  depends_on = [aws_nat_gateway.country-prod-nat-gateway-1]
}

# Associate subnets for public and private route tables
resource "aws_route_table_association" "country-prod-private-route-table-association" {
  subnet_id      = aws_subnet.country-prod-private-subnet-1.id
  route_table_id = aws_route_table.country-prod-private-route-table-1.id
  depends_on     = [aws_nat_gateway.country-prod-nat-gateway-1]
}

resource "aws_route_table_association" "country-prod-public-route-table-association" {
  subnet_id      = aws_subnet.country-prod-public-subnet-1.id
  route_table_id = aws_route_table.country-prod-public-route-table-1.id
  depends_on     = [aws_internet_gateway.country-prod-internet-gateway-1]
}

