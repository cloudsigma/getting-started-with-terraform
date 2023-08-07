terraform {
  required_providers {
    cloudsigma = {
      source  = "cloudsigma/cloudsigma"
      version = "1.10.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}
