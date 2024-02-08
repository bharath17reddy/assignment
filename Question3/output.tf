output "InstanceId" {
  value = aws_instance.example.id
}

output "PublicIpAddress" {
  value = aws_instance.example.public_ip
}
