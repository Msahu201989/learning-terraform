provider "aws" {
  region = "use-east-1"
}

resource "aws_instance" "sample" {
  ami           = "ami-00d48a21603b2119b"
  instance_type = "t3.micro"