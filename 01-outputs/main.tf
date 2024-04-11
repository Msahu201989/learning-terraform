provider "aws" {
  region = "your_aws_region"
}

resource "aws_lb" "alb_shared_dev" {
  name               = "alb-shared-dev"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg_alb_shared_dev"] // Replace with your security group ID
  subnets            = ["subnet-03458dba469a5d163", "subnet-06d92c264a39f674d"] // Replace with your subnet IDs

  enable_deletion_protection = false
}

resource "aws_lb_listener" "alb_shared_dev_http" {
  load_balancer_arn = aws_lb.alb_shared_dev.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "fixed-response"
    status_code      = "404"
    content_type     = "text/plain"
    message_body     = "Not Found"
  }
}

resource "aws_lb_listener" "alb_shared_dev_https_443" {
  load_balancer_arn = aws_lb.alb_shared_dev.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_lb_listener" "alb_shared_dev_https_8099" {
  load_balancer_arn = aws_lb.alb_shared_dev.arn
  port              = 8099
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_lb_listener" "alb_shared_dev_https_8080" {
  load_balancer_arn = aws_lb.alb_shared_dev.arn
  port              = 8080
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}


