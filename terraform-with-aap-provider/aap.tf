variable "aap_controller_host" {
  type    = string
  default = "https://localhost:8043"
}
variable "aap_controller_credential_username" {
  type = string
  default = "admin"
}
variable "aap_controller_credential_password" {
  type = string
  sensitive = true
}
variable "aap_controller_inventory_id" {
  type = number
}

provider "aap" {
  host                 = var.aap_controller_host
  username             = var.aap_controller_credential_username
  password             = var.aap_controller_credential_password
  insecure_skip_verify = true
}

resource "aap_host" "aws_instance" {
  inventory_id = var.aap_controller_inventory_id
  name         = "aws-instance_${var.aws_instance_name}"
  description  = "An EC2 instance created by Terraform"
  variables    = jsonencode(aws_instance.tf_instance)
}

resource "aap_host" "gcp_instance" {
  inventory_id = var.aap_controller_inventory_id
  name         = "gcp-instance_${var.gcp_instance_name}"
  description  = "A GCP instance created by Terraform"
  variables    = jsonencode(google_compute_instance.tf_instance)
}
