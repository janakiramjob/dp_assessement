output "vpc_id" {
  value = aws_vpc.main.id
}

output "wazuh_instance_id" {
  value = aws_instance.wazuh.id
}
