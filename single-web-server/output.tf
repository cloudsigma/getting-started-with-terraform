output "server" {
  description = "The public IP of the web server"
  value       = cloudsigma_server.www.ipv4_address
}
