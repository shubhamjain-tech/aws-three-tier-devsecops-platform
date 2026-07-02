provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-three-tier-devsecops-platform"
      Environment = "bootstrap"
      ManagedBy   = "Terraform"
    }
  }
}