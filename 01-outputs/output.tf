resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [sg-08f870413c1153e2e]
  subnets            = [sg-08f870413c1153e2e]

  enable_deletion_protection = true

#  access_logs {
#    bucket  = aws_s3_bucket.lb_logs.id
#    prefix  = "test-lb"
#    enabled = true
#  }

  tags = {
    Environment = "production"
  }
}