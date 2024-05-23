variable "gcp_credentials_path" { type = string }
variable "gcp_project" { type = string }
variable "gcp_region" {
  type    = string
  default = "us-west1"
}
variable "gcp_zone" {
  type    = string
  default = "us-west1-a"
}
variable "gcp_instance_name" {
  type    = string
  default = "aap-test-tf-aap-provider-2"
}
variable "gcp_instance_network" {
  type    = string
  default = "aap-test-terraform-integration"
}
variable "gcp_instance_subnet" {
  type    = string
  default = "aap-test-terraform-integration-subnet"
}

provider "google" {
  credentials = var.gcp_credentials_path
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

resource "google_compute_instance" "tf_instance" {
  name         = var.gcp_instance_name
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20240110"
      labels = {
        my_label = var.gcp_instance_name
      }
    }
  }

  network_interface {
    network    = var.gcp_instance_network
    subnetwork = var.gcp_instance_subnet
  }
}
