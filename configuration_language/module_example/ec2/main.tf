resource "aws_instance" "example" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = var.instance_type
}

resource "aws_instance" "other" {
  ami           = "ami-01e6a0b85de033c99"
  instance_type = "t2.nano"
}
