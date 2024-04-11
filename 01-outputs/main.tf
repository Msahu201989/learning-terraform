provider "aws" {
region = "your_aws_region"
}

resource "aws_lb" "alb_shared_dev" {
name               = "alb-shared-dev"
internal           = false
load_balancer_type = "application"
security_groups    = ["launch-wizard-2"] // Replace with your security group ID
subnets            = ["subnet-03458dba469a5d163", "subnet-06d92c264a39f674d"] // Replace with your subnet IDs

listener {
port            = 443
protocol        = "HTTPS"
ssl_policy      = "ELBSecurityPolicy-2016-08"
}

listener {
port            = 8099
protocol        = "HTTPS"
ssl_policy      = "ELBSecurityPolicy-2016-08"
}

listener {
port            = 80
protocol        = "HTTP"
}

listener {
port            = 8080
protocol        = "HTTP"
}
}

resource "aws_lb" "alb_shared_uat" {
name               = "alb-shared-uat"
internal           = false
load_balancer_type = "application"
security_groups    = ["sg_alb_shared_dev"] // Replace with your security group ID
subnets            = ["subnet-03458dba469a5d163", "subnet-06d92c264a39f674d"] // Replace with your subnet IDs

listener {
port            = 443
protocol        = "HTTPS"
ssl_policy      = "ELBSecurityPolicy-2016-08"
}

listener {
port            = 8099
protocol        = "HTTPS"
ssl_policy      = "ELBSecurityPolicy-2016-08"
}

listener {
port            = 80
protocol        = "HTTP"
}

listener {
port            = 8080
protocol        = "HTTP"
}
}
