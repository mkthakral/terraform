provider "aws" {
    region = "us-east-1"
}

locals {
    iam_user_extension = "my_iam_user"
}

variable "environment" {
    default = "default"
}

resource "aws_iam_user" "my_iam_user" {
    name = "${local.iam_user_extension}_${var.environment}"
}

