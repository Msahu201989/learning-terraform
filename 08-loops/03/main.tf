resource "aws_instance" "sample" {
  for_each      = var.instances
  ami           = "ami-0a017d8ceb274537d"
  instance_type = each.value.instance_type
  tags = {
    name = each.value.tagName
  }
}

resource "aws_security_group" "allow_ssh" {
  count       = var.create_sg ? 1 : 0
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0aa9e93d9aea8a408"


variable "instances" {
  default = {
    catalogue = {
      instance_type = "t3.micro"
      tagName       = "CATALOGUE"
    }
    cart = {
      instance_type = "t3.micro"
      tagName       = "CART"
    }
  }
}
