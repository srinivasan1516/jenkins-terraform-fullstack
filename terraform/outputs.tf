output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.fullstack_server.id
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.fullstack_server.public_ip
}

output "website_url" {
  description = "Website URL"
  value       = "http://${aws_instance.fullstack_server.public_ip}"
}
