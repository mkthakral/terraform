provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "deleteme-bucket-sept-2022"
  force_destroy = true
}