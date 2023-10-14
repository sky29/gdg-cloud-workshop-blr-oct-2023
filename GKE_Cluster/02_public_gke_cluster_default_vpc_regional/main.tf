terraform {
  required_version = ">= 1.5"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

resource "google_container_cluster" "test-cluster-public" {
  name = var.cluster_name
  location = var.region
  
  remove_default_node_pool = true
  initial_node_count = 1

  network = var.vpc_name
  subnetwork = var.subnet_name

  min_master_version = var.k8s_version
}

resource "google_container_node_pool" "generic-cpu-pool" {
  name       = var.generic_cpu_node_pool
  location   = var.region
  cluster    = google_container_cluster.test-cluster-public.name
  node_count = var.generic_cpu_node_pool_node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      env = var.project_id
    }
    machine_type = var.machine_type
    tags         = ["gke-worker-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}