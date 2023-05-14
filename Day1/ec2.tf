resource "aws_instance" "country-prod-mongo-1" {
  ami = "ami-00524892644de0958" #AMI ID is different for different regions
  instance_type = "t4g.nano"
  key_name = "learn-terraform"
  associate_public_ip_address = true
  tags = {
    "ENV" = "production"
  }
}