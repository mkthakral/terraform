provider "aws" {
  region  = "us-east-1"
  
}

variable "names" {
  default = ["ravs", "tom", "jane"]
}

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name = each.value
}