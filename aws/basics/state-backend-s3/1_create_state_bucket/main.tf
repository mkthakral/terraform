provider "aws" {
  region  = "us-east-1"
}


//To avoid deletion of S3 project
resource "aws_s3_bucket" "enterprise_backend_state" {
    bucket = "bucket-for-terraform-project-mkthakral"

    lifecycle {
        prevent_destroy = true
    }
}

//Versioning to recover file in case of any fault
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.enterprise_backend_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

//Encryption of bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.enterprise_backend_state.bucket
 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


//Locking of state file using DynamoDB
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}