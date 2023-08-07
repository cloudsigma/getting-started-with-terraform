terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudsigma = {
      source  = "cloudsigma/cloudsigma"
      version = "1.10.3"
    }
  }
}
