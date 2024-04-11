resource "aws_vpc" "example" {
  cidr_block = "172.18.83.0/26"
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = {
    "Application" = "Control-M|Alfresco"
    "Stack"       = "DEV"
    "Name"        = "vpc_shared_dev"
    "Module"      = "Shared"
  }
}

resource "aws_subnet" "subnet_az1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "172.18.83.0/27"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    "Stack"     = "Shared"
    "Module"    = "VPC"
    "Name"      = "vpc_shared_dev_pvt_az1"
    "Application" = "Control-M|Alfresco"
  }
}

resource "aws_subnet" "subnet_az2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "172.18.83.32/27"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    "Stack"     = "Shared"
    "Module"    = "VPC"
    "Name"      = "vpc_shared_dev_pvt_az2"
    "Application" = "Control-M|Alfresco"
  }
}

resource "aws_security_group" "example" {
  name_prefix = "example-"
  vpc_id      = aws_vpc.example.id
  // Define your security group rules here
}

resource "aws_lb" "example" {
  name               = "alb-shared-dev"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.example.id]
  subnets            = [aws_subnet.subnet_az1.id, aws_subnet.subnet_az2.id]

  tags = {
    "Module"      = "Load Balancer"
    "Application" = "Alfresco"
    "Stack"       = "DEV"
  }
}

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
      query       = "#{query}"
      path        = "/#{path}"
      host        = "#{host}"
    }
  }
}

resource "aws_lb_listener" "listener_https" {
  load_balancer_arn = aws_lb.example.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn  = "arn:aws:acm:us-east-1:719927028882:certificate/fb1332d4-01e5-41b5-abac-bb3516cfb924"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Error 503</h1> <p>This path is not configured in the listener rules</p> <p> - Shared Dev ALB</p>"
      status_code  = "503"
    }
  }
}

resource "aws_lb_listener" "listener_http_app" {
  load_balancer_arn = aws_lb.example.arn
  port              = 8095
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_router.arn
  }
}

resource "aws_lb_target_group" "target_group_router" {
  name                  = "Alfresco-Transform-Router-Dev-tg"
  port                  = 8095
  protocol              = "HTTP"
  vpc_id                = aws_vpc.example.id
  target_type           = "ip"
  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher {
      http_code         = "404"
    }
  }
}

resource "aws_lb_target_group" "target_group_core" {
  name                  = "Alfresco-Transform-Core-Dev"
  port                  = 8090
  protocol              = "HTTP"
  vpc_id                = aws_vpc.example.id
  target_type           = "ip"
  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher {
      http_code         = "404"
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule_core" {
  listener_arn = aws_lb_listener.listener_http_app.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_core.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
