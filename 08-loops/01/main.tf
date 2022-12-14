resource "aws_instance" "sample" {
  count = 2
  ami           = "ami-00d48a21603b2119b"
  instance_type = "t3.micro"
  tags = {
    Name = "test-${count.index}"
  }
}

output "public_ip" {                        #Print public IP
  value = aws_instance.sample.*.public_ip   # We use .*. if we have multiple instance
}
