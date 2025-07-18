module "account" {
  source          = "../modules/account"
  ssh_bucket      = module.spaces.ssh_bucket
  droplet_jenkins = module.droplet.droplet_jenkins
  volume_jenkins  = module.storage.volume_jenkins
  public_lb       = module.network.public_lb

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

module "network" {
  source          = "../modules/network"
  droplet_jenkins = module.droplet.droplet_jenkins
}

module "droplet" {
  source         = "../modules/droplet"
  vpc_id         = module.network.vpc_id
  openssh_key    = module.account.openssh_key
  volume_jenkins = module.storage.volume_jenkins
}

module "storage" {
  source          = "../modules/storage"
  droplet_jenkins = module.droplet.droplet_jenkins
}
