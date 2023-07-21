terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    
    }
  }

  backend "remote" {
  organization = "cloudgurukool"
  workspaces {
   name = "terraform-aws-ecs"
   }
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::108040610828:role/ec2-role"
  }
}