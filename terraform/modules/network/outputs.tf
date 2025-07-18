output "vpc_id" {
  description = "VPC ID for droplets"
  value = digitalocean_vpc.main_vpc.id
}

output "public_lb" {
  description = "The Public Load Balancer"
  value = digitalocean_loadbalancer.public_lb
}