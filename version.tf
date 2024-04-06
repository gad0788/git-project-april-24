terraform {
  required_providers {
    aws = "hashicorp/aws"
    version = "4.61.0"
  }
}
provider "aws" {
 region = "us-east-1" 
}