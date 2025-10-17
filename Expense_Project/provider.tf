terraform {
   required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}

#provide authentication
provider "aws" {
  region = "us-east-1"
}