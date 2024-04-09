terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }

  backend "s3" {

    bucket = "terraform-09042024-saurabh"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "state_lock_saurabh"

   
  }
}

provider "aws" {
  # Configuration options
}