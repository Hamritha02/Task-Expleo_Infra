terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
 }
}

provider "aws" {
 region = "us-east-1"
 //access_key = "AKIAQBLYN2U3GYAIDWFG"
// secret_key = "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"
}
