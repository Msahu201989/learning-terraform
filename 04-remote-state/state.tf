terraform {
  backend "s3" {
    bucket = "Terraform-sahu"
    key    = "04-resources/terraform.tfstate"
    region = "us-east-1"
  }
}