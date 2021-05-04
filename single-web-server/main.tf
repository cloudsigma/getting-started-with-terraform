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


resource "cloudsigma_ssh_key" "demo" {
  name        = "demo"
  private_key = file("~/.ssh/demo")
  public_key  = file("~/.ssh/demo.pub")
}

resource "cloudsigma_drive" "debian" {
  // Debian 10.7 server
  clone_drive_id = "84eef318-c7d0-41ff-99b5-272becb81986"

  media = "disk"
  name  = "debian"
  size  = 15 * 1024 * 1024 * 1024 # 15GB
}

resource "cloudsigma_server" "www" {
  cpu          = 2000              # 2GHz CPU
  memory       = 512 * 1024 * 1024 # 512MB RAM
  name         = "www"
  vnc_password = "cloudsigma"

  drive {
    uuid = cloudsigma_drive.debian.uuid
  }

  ssh_keys = [cloudsigma_ssh_key.demo.uuid]

  provisioner "remote-exec" {
    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "cloudsigma"
      private_key = cloudsigma_ssh_key.demo.private_key
    }

    inline = [
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
    ]
  }
}
