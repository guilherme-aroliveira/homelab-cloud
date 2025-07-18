# Create a new Web Droplet in the nyc3 region
resource "digitalocean_droplet" "jenkins_server" {
  image     = "debian-12-x64"
  name      = "jenkins-server"
  vpc_uuid  = var.vpc_id
  region    = "nyc3"
  size      = "s-1vcpu-1gb"
  ssh_keys  = ["${var.openssh_key}".id]
  user_data = filebase64("${path.module}/scripts/jenkins.sh")
  tags      = [digitalocean_tag.jenkins_server_tag.name]
  backups   = true
}

# Create a new tag
resource "digitalocean_tag" "jenkins_server_tag" {
  name = "jenkins-server"
}
