resource "aws_instance" "sample" {
  for_each      = var.instances
  ami           = "ami-0a017d8ceb274537d"
  instance_type = each.value.instance_type
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
