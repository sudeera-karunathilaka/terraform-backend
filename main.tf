resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "tf-state-bucket-${var.app_name}-${var.aws_account_id}"
}

resource "aws_s3_bucket_acl" "tf_state_bucket_bucket_acl" {
  bucket = aws_s3_bucket.tf_state_bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_sse" {
  bucket = aws_s3_bucket.tf_state_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_lock_table" {
  name         = "tf-state-lock-table"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}