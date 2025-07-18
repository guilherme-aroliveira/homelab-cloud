output "vpc_id" {
  description = "VPC ID for droplets"
  value = digitalocean_vpc.main_vpc.id
}