provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "shared_dev_vpc" {
  cidr_block       = "172.18.83.0/26"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    "Application" = "Control-M|Alfresco"
    "Stack"       = "DEV"
    "Name"        = "vpc_shared_dev"
    "Module"      = "Shared"
  }
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id                  = aws_vpc.shared_dev_vpc.id
  cidr_block              = "172.18.83.0/27"
  availability_zone       = "us-east-1a"  // Specify the availability zone, not the ID
  map_public_ip_on_launch = false

  tags = {
    "Stack"       = "Shared"
    "Module"      = "VPC"
    "Name"        = "vpc_shared_dev_pvt_az1"
    "Application" = "Control-M|Alfresco"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id                  = aws_vpc.shared_dev_vpc.id
  cidr_block              = "172.18.83.32/27"
  availability_zone       = "us-east-1b"  // Specify the availability zone, not the ID
  map_public_ip_on_launch = false

  tags = {
    "Stack"       = "Shared"
    "Module"      = "VPC"
    "Name"        = "vpc_shared_dev_pvt_az2"
    "Application" = "Control-M|Alfresco"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.shared_dev_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}