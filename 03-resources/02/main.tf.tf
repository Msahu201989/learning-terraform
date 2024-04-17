provider = var.provider

provider "aws" {
  region = "use-east-1"
}

resource "aws_instance" "sample" {
  ami           = "ami-00d48a21603b2119b"
  instance_type = "t3.micro"

#  root_block_device {
#    volume_size = 15
#  }
#}
#
#output "ec2_public_ip" {
#  value = aws_instance.sample.public_ip
#}

