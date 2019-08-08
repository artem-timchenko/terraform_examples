provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}

resource "aws_instance" "web" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"

  depends_on = [
    aws_instance.db_instance
  ]
}

resource "aws_instance" "db_instance" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"
}
