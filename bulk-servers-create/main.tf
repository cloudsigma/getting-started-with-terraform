terraform {
  required_providers {
    cloudsigma = {
      source  = "cloudsigma/cloudsigma"
      version = "1.4.0"
    }
  }
}

provider "cloudsigma" {
  username = var.cloudsigma_username
  password = var.cloudsigma_password
}


resource "cloudsigma_server" "backend" {
  count = 5

  cpu          = 1000              # 1GHz CPU
  memory       = 512 * 1024 * 1024 # 512MB RAM
  name         = "backend-${count.index}"
  vnc_password = "cloudsigma"
}
