provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_key
  spaces_secret_key = var.spaces_secret
}

provider "newrelic" {
  account_id = var.newrelic_account
  api_key    = var.newrelic_api
  region     = var.newrelic_region
}
