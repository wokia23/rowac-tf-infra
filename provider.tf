#Below is the provider which helps in connecting with AWS account
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"   #replace "us-west-2" with the region you are working in
}