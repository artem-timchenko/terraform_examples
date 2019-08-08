provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terra"
  version                 = "~> 2.0"
  region                  = "eu-west-1"
}
