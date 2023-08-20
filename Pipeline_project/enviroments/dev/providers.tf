
terraform {

  backend "s3" {
    bucket = "musab-aws-pipeline-project5343"
    key    = "./terraform.state"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}