terraform {
  required_providers {
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
