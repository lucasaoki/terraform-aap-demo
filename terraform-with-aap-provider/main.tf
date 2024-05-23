terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }

    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }

    aap = {
      source = "ansible/aap"
    }
  }
}
