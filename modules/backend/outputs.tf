output "backend_private_ips" {
  value = aws_instance.backend.*.private_ip
}

output "backend_private_dns" {
  value = aws_instance.backend.*.private_dns
}
