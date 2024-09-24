terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
      version = "0.50.0"
    }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "ovh" {
  # Configuration options
  endpoint = "ovh-eu"
  application_key = var.application_key
  application_secret = var.application_secret
  consumer_key = var.consumer_key
}

# Configure the OpenStack Provider
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"
}