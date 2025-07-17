module "account" {
  source     = "../modules/account"
  tf_state   = module.spaces.tf_state
  ssh_bucket = module.spaces.ssh_bucket

  providers = {
    digitalocean = digitalocean
  }
}

module "spaces" {
  source      = "../modules/spaces"
  ssh_rsa_key = module.account.ssh_rsa_key

  providers = {
    digitalocean = digitalocean
  }
}
