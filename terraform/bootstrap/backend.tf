terraform {
  backend "s3" {
    bucket         = "three-tier-devsecops-tfstate-123456789012"
    key            = "bootstrap/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}