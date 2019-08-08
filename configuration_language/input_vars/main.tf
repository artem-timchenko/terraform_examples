provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = var.image_id
  instance_type = var.image_size
}
