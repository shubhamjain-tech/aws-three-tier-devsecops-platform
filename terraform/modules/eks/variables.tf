variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_security_group_id" {
  type = string
}

variable "kubernetes_version" {
  type = string
}