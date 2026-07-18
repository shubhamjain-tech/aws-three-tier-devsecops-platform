variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "bucket_name" {
  description = "Terraform State Bucket"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Terraform Lock Table"
  type        = string
}