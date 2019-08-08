provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}

resource "aws_instance" "server" {
  count = 3

  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

output "instances_ip_addr" {
  value = aws_instance.server[*].private_ip
}
