variable "vpc_id" {
  description = "VPC ID for droplets"
}

variable "jenkins_key" {
  description = "Jenkins SSH key"
}

variable "firezone_key" {
  description = "Firezone SSH key"
}

variable "volume_jenkins" {
  description = "Block storage for Jenkins Server"
}
