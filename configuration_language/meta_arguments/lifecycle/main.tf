provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}

resource "aws_instance" "example_create_before_destroy" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "example_prevent_destroy" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_instance" "example_ignore_changes" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
