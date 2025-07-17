terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.44"
    }
  }
}
