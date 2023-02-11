terraform {
  backend "s3" {
    bucket = "taskterra"
    key    = "home/ubuntu/.terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
