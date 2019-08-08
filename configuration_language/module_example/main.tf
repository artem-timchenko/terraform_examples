provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}

module "instance" {
  source = "./ec2"

  instance_type = "t2.small"
}

output "instance_ip_addr" {
  value       = module.instance.ip
  description = "The private IP address of the main server instance."
}
