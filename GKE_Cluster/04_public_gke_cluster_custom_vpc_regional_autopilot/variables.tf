variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "cluster_name" {
  type = string
  default = "test-cluster-public-vpc-default"
}

variable "k8s_version" {
  type = string
  default = "1.27.3-gke.100"
}

variable "vpc_name" {
  type = string
  default = "test-vpc"
}

variable "subnet_name" {
  type = string
  default = "test-vpc-subnet"
}

variable "generic_cpu_node_pool" {
  type = string
  default = "generic-cpu-node-pool"
}

variable "generic_cpu_node_pool_node_count" {
  type = string
  default = "2"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "terraform_sa" {
  type = string
  default = "terraform_sa"
}