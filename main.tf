terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}

provider "registry.terraform.io/hashicorp/google" {
  credentials = file(var.gcp_credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20240312"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}