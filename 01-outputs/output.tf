resource "aws_lb" "main" {
  name               = "app-alb"
  internal           = internal
  load_balancer_type = application
  security_groups    = [sg-08f870413c1153e2e]
  subnets            = [subnet-03458dba469a5d163]
  #tags               = merge(local.tags, {Name = "${var.env}-alb"})
}

#
#resource "aws_security_group" "main" {
#  name        = local.sg_name
#  description = local.sg_name
#  vpc_id      =  var.vpc_id
#  tags         = merge(var.tags, {Name = local.sg_name})
#


  ingress {
    description = "APP"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}