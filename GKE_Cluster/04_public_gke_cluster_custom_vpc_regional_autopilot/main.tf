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

resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = var.subnet_name
  ip_cidr_range = "10.10.0.0/16"
  region = var.region
  network = google_compute_network.vpc.name
}

resource "google_container_cluster" "test-cluster-public" {
  name = var.cluster_name
  location = var.region
  
  network = google_compute_network.vpc.name
  subnetwork = var.subnet_name

  enable_autopilot = true
}