resource "aws_security_group" "security-group-for-jenkins" {
  name   = var.security_group_for_jenkins_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.security_group_ingress_1_cidr_block
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.security_group_ingress_2_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.security_group_egress_1_cidr_block

  }

  tags = {
    Name : "${var.env-prefix}-security-group-for-jenkins"
  }

}


resource "aws_instance" "jenkins-server-1" {
  ami           = var.jenkins_instance_ami
  instance_type = var.jenkins_instance_instance_type
  # get the output from subnet module
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.security-group-for-jenkins.id]
  availability_zone      = var.jenkins_instance_az

  associate_public_ip_address = var.jenkins-instance_associate_public_ip_address
  # Create the keypair first the refer that name here
  key_name = "jenkins-key-pair"

  tags = {
    Name : "${var.env-prefix}-jenkins-server"
  }
}
