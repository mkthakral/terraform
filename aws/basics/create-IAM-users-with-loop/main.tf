provider "aws" {
  region = "us-east-1"
}

variable "iam_user_name_prefix" {
  type    = string
  default = "my_iam_user"
}

resource "aws_iam_user" "my_TF_iam_users" {
  count = 3
  name  = "${var.iam_user_name_prefix}_${count.index}"
}