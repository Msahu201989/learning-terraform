provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "EC2VPC00vpc0828f2c8c45dd2c6600dObwd" {
  cidr_block       = "172.18.83.64/26"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "vpc_shared_uat"
    "Module"      = "Shared"
    "Application" = "Control-M|Alfresco"
    "Stack"       = "UAT"
  }
}

resource "aws_subnet" "EC2Subnet00subnet044ad37e37ab9f32a00U0hiY" {
  vpc_id                  = aws_vpc.EC2VPC00vpc0828f2c8c45dd2c6600dObwd.id
  cidr_block              = "172.18.83.64/27"
  map_public_ip_on_launch = false
  availability_zone_id    = "use1-az1"
  tags = {
    "Name"        = "vpc_shared_uat_pvt_az1"
    "Module"      = "VPC"
    "Application" = "Control-M|Alfresco"
    "Stack"       = "Shared"
  }
}

resource "aws_subnet" "EC2Subnet00subnet0572f5bd8c256064e00kHd0p" {
  vpc_id                  = aws_vpc.EC2VPC00vpc0828f2c8c45dd2c6600dObwd.id
  cidr_block              = "172.18.83.96/27"
  map_public_ip_on_launch = false
  availability_zone_id    = "use1-az2"
  tags = {
    "Name"        = "vpc_shared_uat_pvt_az2"
    "Module"      = "VPC"
    "Application" = "Control-M|Alfresco"
    "Stack"       = "Shared"
  }
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.EC2VPC00vpc0828f2c8c45dd2c6600dObwd.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "ElasticLoadBalancingV2LoadBalancer00loadbalancerappalbshareduat528ffdfd203a1b3800yGoIk" {
  name               = "alb-shared-uat"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.example.id]
  subnets            = [aws_subnet.EC2Subnet00subnet0572f5bd8c256064e00kHd0p.id, aws_subnet.EC2Subnet00subnet044ad37e37ab9f32a00U0hiY.id]

  tags = {
    "Module"      = "Load Balancer"
    "Application" = "Alfresco"
    "Stack"       = "UAT"
  }
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener00listenerappalbshareduat528ffdfd203a1b3815902e2cd968e57d00WlhGv" {
  load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer00loadbalancerappalbshareduat528ffdfd203a1b3800yGoIk.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      status_code  = "503"
      message_body = "<h1>Error 503</h1> <p>This path is not configured in the listener rules</p> <p> - Shared UAT ALB</p>"
    }
  }

  certificate_arn = "arn:aws:acm:us-east-1:719927028882:certificate/fb1332d4-01e5-41b5-abac-bb3516cfb924"
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener00listenerappalbshareduat528ffdfd203a1b382c728941cddc408800X8akk" {
  load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer00loadbalancerappalbshareduat528ffdfd203a1b3800yGoIk.arn
  port              = 8099
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup00targetgroupalfrescosfsuat268aba376ddd572800XrIqf.arn
  }
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener00listenerappalbshareduat528ffdfd203a1b384afabd6cb81076c4001YrRC" {
  load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer00loadbalancerappalbshareduat528ffdfd203a1b3800yGoIk.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      protocol       = "HTTPS"
      port           = "443"
      status_code    = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup00targetgroupalfrescosfsuat268aba376ddd572800XrIqf" {
  name        = "alfresco-sfs-uat"
  port        = 8099
  protocol    = "HTTP"
  vpc_id      = aws_vpc.EC2VPC00vpc0828f2c8c45dd2c6600dObwd.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/alfresco/s"
    port                = "8099"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}
