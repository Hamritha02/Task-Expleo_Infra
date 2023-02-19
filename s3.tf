terraform {   
  backend "s3" {
    bucket = "terrae"
    key    = "home/ubuntu/project/.terraform/terraform.tfstate"
    region =  var.region
    encrypt = true
  }
}
