variable "aws_profile" {
  type    = string
  default = null
}
variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "aws_instance_name" {
  type    = string
  default = "aap-test-terraform-integration-1"
}
variable "aws_subnet_id" {
  type    = string
  default = null
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "tf_instance" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  tags = {
    Name = var.aws_instance_name
  }
  subnet_id = var.aws_subnet_id
}
