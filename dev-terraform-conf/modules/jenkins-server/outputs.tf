output "jenkins-server-public-ip-address" {
  value = aws_instance.jenkins-server-1.public_ip
}