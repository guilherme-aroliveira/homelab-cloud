resource "digitalocean_spaces_bucket" "do_ssh_key_bucket" {
  name   = "space-bucket-ssh-key"
  region = var.bucket_region
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "digitalocean_spaces_bucket_object" "do_ssh_key_droplet" {
  region  = digitalocean_spaces_bucket.do_ssh_key_bucket.region
  bucket  = digitalocean_spaces_bucket.do_ssh_key_bucket.name
  key     = "server-key.pub"
  content = var.ssh_rsa_key
}
