terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }
}

provider "aws" {
  # Configuration options

  region = "us-east-1"
}

provider "aws" {

  alias = "aws-us-east-2"

  region = "us-east-2"
  
}