variable "bucket_region" {
  description = "Region for the space bucket"
  type        = string
  default     = "nyc3"
}

variable "jenkins_private_key" {
  description = "The Jenkins private ssh key"
}

variable "firezone_private_key" {
  description = "The Firezone private ssh key"
}
