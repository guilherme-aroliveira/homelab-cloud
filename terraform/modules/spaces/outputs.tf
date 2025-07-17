output "tf_state" {
  description = "Space Bucket for terraform state files"
  value = digitalocean_spaces_bucket.do_tf_state_bucket.urn
}

output "ssh_bucket" {
  description = "Space Bucket for ssh keys"
  value = digitalocean_spaces_bucket.do_ssh_key_bucket.urn
}