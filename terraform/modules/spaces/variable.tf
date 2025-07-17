variable "bucket_region" {
  description = "Region for the space bucket"
  type = string
  default = "nyc3"
}

variable "ssh_rsa_key" {
  description = "The private ssh key"
}