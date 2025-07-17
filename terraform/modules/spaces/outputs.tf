output "ssh_bucket" {
  description = "Space Bucket for ssh keys"
  value = digitalocean_spaces_bucket.do_ssh_key_bucket.urn
}