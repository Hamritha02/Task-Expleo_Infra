terraform {
  backend "s3" {
    bucket = "taskterra"
    key    = "home/ubuntu/project/.terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
