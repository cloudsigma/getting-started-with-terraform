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


resource "cloudsigma_drive" "drive" {
  count = 10

  // Debian 10.7 server
  clone_drive_id = "84eef318-c7d0-41ff-99b5-272becb81986"
  media          = "disk"
  name           = "bulk-drive-${count.index}"
  size           = 15 * 1024 * 1024 * 1024 # 15GB
}
