terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}


terraform {
  backend "s3" {
    bucket = "mosalahbucketdevoooo"
    key    = "tf_store"
    region = "us-east-2"
  }
}
