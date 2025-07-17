variable "AWS_REGION" {
  description = "AWS region for the tfstate S3 bucket"
  type        = string
  default     = "us-east-1"
}

variable "do_token" {
  description = "DigitalOcean Token"
  type        = string
  sensitive   = true
}

variable "spaces_key" {
  description = "Spaces Access Key"
  type        = string
  sensitive   = true
}

variable "spaces_secret" {
  description = "Spaces Secret Key"
  type        = string
  sensitive   = true
}

#######################
# New Relic variables
#######################

variable "newrelic_api" {
  type      = string
  sensitive = true
}

variable "newrelic_account" {
  type      = string
  sensitive = true
}

variable "newrelic_region" {
  type      = string
  sensitive = true
}
