output "cloudsigma_server_ipv4_address" {
  description = "The public IP of the web server on CloudSigma platform"
  value       = cloudsigma_server.server.ipv4_address
}

output "aws_server_ipv4_address" {
  description = "The public IP of the web server on AWS platform"
  value       = aws_instance.web.public_ip
}
