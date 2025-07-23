module "account" {
  source           = "../modules/account"
  ssh_bucket       = module.spaces.ssh_bucket
  droplet_jenkins  = module.droplet.droplet_jenkins
  droplet_firezone = module.droplet.droplet_firezone
  volume_jenkins   = module.storage.volume_jenkins

  providers = {
    digitalocean = digitalocean
  }
}

module "spaces" {
  source      = "../modules/spaces"
  private_key = module.account.private_key
  
  providers = {
    digitalocean = digitalocean
  }
}

module "network" {
  source           = "../modules/network"
  droplet_jenkins  = module.droplet.droplet_jenkins
  droplet_firezone = module.droplet.droplet_firezone
}

module "droplet" {
  source         = "../modules/droplet"
  vpc_id         = module.network.vpc_id
  jenkins_key    = module.account.jenkins_key
  firezone_key   = module.account.firezone_key
  volume_jenkins = module.storage.volume_jenkins

}

module "storage" {
  source          = "../modules/storage"
  droplet_jenkins = module.droplet.droplet_jenkins
}
