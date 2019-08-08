variable "image_id" {
  type        = string
  default     = "ami-01e6a0b85de033c99"
  description = "The id of the machine image (AMI) to use for the server."
}

variable "image_size" {
  type        = string
  default     = "t2.micro"
  description = "The size of instance to create"
}
