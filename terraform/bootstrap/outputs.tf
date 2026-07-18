output "terraform_state_bucket_name" {
  description = "Terraform state S3 bucket name"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "terraform_lock_table_name" {
  description = "Terraform DynamoDB lock table name"
  value       = aws_dynamodb_table.terraform_lock.name
}