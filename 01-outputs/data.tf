#provider "aws" {
#  region = "us-east-1"
#}
#
#resource "aws_security_group" "example" {
#  name        = "launch-wizard-5"
#  description = "Security group for the load balancer"
#  vpc_id      = "vpc-0fc9b678fbbe73d32"
#}
#
#resource "aws_elb" "example" {
#  name               = "example-load-balancer"
#  availability_zones = ["us-east-1a"]
#  security_groups    = [aws_security_group.example.id]
#  subnets            = ["subnet-08bf3846703ca8ff8"]
#
#  listener {
#    instance_port     = 80
#    instance_protocol = "HTTP"
#    lb_port           = 80
#    lb_protocol       = "HTTP"
#  }
#
#  health_check {
#    target              = "HTTP:80/"
#    interval            = 30
#    timeout             = 5
#    healthy_threshold   = 2
#    unhealthy_threshold = 2
#  }
#}
