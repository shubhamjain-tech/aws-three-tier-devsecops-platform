# ==============================================================================
# S3 Bucket for Terraform Remote State
# ==============================================================================

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "terraform-state-bucket"
    }
  )
}

# ==============================================================================
# Enable Versioning
# ==============================================================================

resource "aws_s3_bucket_versioning" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }

}

# ==============================================================================
# Enable Server Side Encryption
# ==============================================================================

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

# ==============================================================================
# Block Public Access
# ==============================================================================

resource "aws_s3_bucket_public_access_block" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls  = true
  ignore_public_acls = true

  block_public_policy     = true
  restrict_public_buckets = true

}

# ==============================================================================
# Ownership Controls
# ==============================================================================

resource "aws_s3_bucket_ownership_controls" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

# ==============================================================================
# DynamoDB Table for Terraform State Locking
# ==============================================================================

resource "aws_dynamodb_table" "terraform_lock" {

  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "terraform-lock"
    }
  )
}