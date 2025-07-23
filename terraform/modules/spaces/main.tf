# create a bucket for ssh keys
resource "digitalocean_spaces_bucket" "do_ssh_key_bucket" {
  name   = "space-bucket-ssh-key"
  region = var.bucket_region
  acl    = "private"

  versioning {
    enabled = true
  }
}

# create a object bucket for jenkins ssh key
resource "digitalocean_spaces_bucket_object" "do_jenkins_ssh_key" {
  region  = digitalocean_spaces_bucket.do_ssh_key_bucket.region
  bucket  = digitalocean_spaces_bucket.do_ssh_key_bucket.name
  key     = "jenkins-server-key"
  content = var.private_key
}

# create a object bucket for firezone ssh key

resource "digitalocean_spaces_bucket_object" "do_firezone_ssh_key" {
  region  = digitalocean_spaces_bucket.do_ssh_key_bucket.region
  bucket  = digitalocean_spaces_bucket.do_ssh_key_bucket.name
  key     = "firezone-vpn-key"
  content = var.private_key
}