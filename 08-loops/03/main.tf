resource "aws_instance" "sample" {
  for_each      = var.instances
  ami           = "ami-00d48a21603b2119b"
  instance_type = "each.value.instance_type"
  tags = {
    name = each.value.tagName
  }
}

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
