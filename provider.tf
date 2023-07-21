terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    
    }
  }
}
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::108040610828:role/ec2-role"
  }
}