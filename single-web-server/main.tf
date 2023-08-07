provider "cloudsigma" {
  username = var.cloudsigma_username
  password = var.cloudsigma_password
}

data "cloudsigma_library_drive" "debian" {
  filter {
    name   = "name"
    values = ["Debian 10.13 Server"]
  }
}

resource "cloudsigma_drive" "debian" {
  clone_drive_id = data.cloudsigma_library_drive.debian.id

  media = "disk"
  name  = "www"
  size  = 15 * 1024 * 1024 * 1024 # 15GB
}

resource "cloudsigma_server" "www" {
  cpu          = 2000              # 2GHz CPU
  memory       = 512 * 1024 * 1024 # 512MB RAM
  name         = "www"
  vnc_password = "Cl0udS!gma"

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

resource "cloudsigma_ssh_key" "demo" {
  name        = "demo"
  private_key = trimspace(tls_private_key.key.private_key_openssh)
  public_key  = trimspace(tls_private_key.key.public_key_openssh)
}

resource "tls_private_key" "key" {
  algorithm = "ED25519"
}
