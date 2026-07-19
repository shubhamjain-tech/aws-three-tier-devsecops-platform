output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "eks_node_security_group_id" {
  value = module.security_group.eks_node_security_group_id
}

output "database_security_group_id" {
  value = module.security_group.database_security_group_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}