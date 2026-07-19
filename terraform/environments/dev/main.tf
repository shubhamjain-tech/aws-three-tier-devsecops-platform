module "vpc" {

  source = "../../modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

module "security_group" {
  source = "../../modules/security-groups"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

module "eks" {

  source = "../../modules/eks"

  project_name = var.project_name
  environment  = var.environment

  cluster_name = "${var.project_name}-${var.environment}"

  kubernetes_version = "1.31"

  cluster_role_arn = module.iam.eks_cluster_role_arn

  private_subnet_ids = module.vpc.private_subnet_ids

  eks_security_group_id = module.security_group.eks_node_security_group_id
}