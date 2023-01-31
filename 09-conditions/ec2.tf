resource "aws_instance" "sample" {
  ami           = "ami-0bb6af715826253bf"
  instance_type = "t3.micro"
  vpc_security_group_ids = aws_security_group.allow_sh.*.id

  tags = {
    name = "test"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = "DevOps321"
      host     = self.public_ip
    }

    inline = [        # used inline to run cmds
     "yum install nginx -y",
      "systemctl start nginx"
    ]
  }

}



resource "aws_security_group" "allow_sh" {
  count       = var.create_sg ? 1 : 0
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0aa9e93d9aea8a408"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

variable "create_sg" {
  default = true
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "local.message"
  }
}

locals {
  message = "echo hello world"

}