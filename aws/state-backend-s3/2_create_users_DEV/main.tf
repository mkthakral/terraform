provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "bucket-for-terraform-project-mkthakral"
        key = "dev/state"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock-dynamo"
        encrypt = true
    }
}

resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user-terraform"
}

