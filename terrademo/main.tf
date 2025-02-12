terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.17.0"
    }
  }
}

provider "google" {
  project     = "pacific-ethos-448615-i4"
  region      = "fr-central"
  credentials = "./keys/my-creds.json"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "pacific-ethos-448615-i4-terra-bucket"
  location      = "EU"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}