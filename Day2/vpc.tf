# Create VPC with cidr - 192.0.0.0/16
resource "aws_vpc" "country-prod-vpc" {
  cidr_block         = "192.0.0.0/16"
  enable_dns_support = true

  tags = {
    Name        = "country-prod-vpc"
    Environment = "prod"
    Owner       = "Country"
  }
}

# Create public and private subnets
resource "aws_subnet" "country-prod-public-subnet-1" {
  vpc_id            = aws_vpc.country-prod-vpc.id
  cidr_block        = "192.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "country-prod-public-subnet-1"
    Environment = "prod"
    Owner       = "Country"
  }
}

resource "aws_subnet" "country-prod-private-subnet-1" {
  vpc_id            = aws_vpc.country-prod-vpc.id
  cidr_block        = "192.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "country-prod-private-subnet-1"
    Environment = "prod"
    Owner       = "Country"
  }
}

# Create internet gateway to access the internet for the resources deployed in public subnet
resource "aws_internet_gateway" "country-prod-internet-gateway-1" {
  vpc_id = aws_vpc.country-prod-vpc.id
  tags = {
    Name        = "country-prod-internet-gateway-1"
    Environment = "prod"
    Owner       = "Country"
  }
}

# Create public route table
resource "aws_route_table" "country-prod-public-route-table-1" {
  vpc_id = aws_vpc.country-prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.country-prod-internet-gateway-1.id
  }

  tags = {
    Name        = "country-prod-public-route-table-1"
    Environment = "prod"
    Owner       = "Country"
  }
}

# Private route table depends on NAT Gateway and this depends on elastic IP
# Create elastic ip
resource "aws_eip" "country-prod-elastic-ip-1" {}

resource "aws_nat_gateway" "country-prod-nat-gateway-1" {
  allocation_id = aws_eip.country-prod-elastic-ip-1.id
  subnet_id     = aws_subnet.country-prod-public-subnet-1.id

  tags = {
    Name        = "country-prod-nat-gateway-1"
    Environment = "prod"
    Owner       = "Country"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.country-prod-internet-gateway-1]
}

# Create private route table
resource "aws_route_table" "country-prod-private-route-table-1" {
  vpc_id = aws_vpc.country-prod-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.country-prod-nat-gateway-1.id
  }

  tags = {
    Name        = "country-prod-private-route-table-1"
    Environment = "prod"
    Owner       = "Country"
  }
}

# Associate subnets for public and private route tables
resource "aws_route_table_association" "country-prod-private-route-table-association" {
  subnet_id      = aws_subnet.country-prod-private-subnet-1.id
  route_table_id = aws_route_table.country-prod-private-route-table-1.id
}

resource "aws_route_table_association" "country-prod-public-route-table-association" {
  subnet_id      = aws_subnet.country-prod-public-subnet-1.id
  route_table_id = aws_route_table.country-prod-public-route-table-1.id
}

