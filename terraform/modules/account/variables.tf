variable "ssh_bucket" {
  description = "Space Bucket for ssh keys"
}

variable "droplet_jenkins" {
  description = "Droplet Jenkins server"
}

variable "volume_jenkins" {
  description = "Block storage for Jenkins Server"
}

variable "public_lb" {
  description = "The Public Load Balancer"
}