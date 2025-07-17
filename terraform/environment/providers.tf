provider "digitalocean" {
  token = var.do_token
}

provider "newrelic" {
  account_id = var.newrelic_account
  api_key    = var.newrelic_api
  region     = var.newrelic_region
}
