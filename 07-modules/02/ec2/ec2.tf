resource "aws_instance" "sample" {
  ami           = "ami-00d48a21603b2119b"
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.SG_ID]
}

variable "SG_ID" {}

