output "server_ipv4_address" {
  description = "The public IP of the web server"
  value       = cloudsigma_server.www.ipv4_address
}

output "ssh_private_key" {
  description = "The private SSH key of the web server"
  value       = cloudsigma_ssh_key.demo.private_key
  sensitive   = true
}
