output "server_ip" {
  description = "Public IP of the provisioned EC2 server"
  value       = aws_eip.app_ip.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the server"
  value       = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_eip.app_ip.public_ip}"
}
