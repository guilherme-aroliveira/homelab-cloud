/*terraform {
  required_version = ">= 1.12.2"

  backend "s3" {
    endpoints = {
      s3 = "https://<your_bucket_region>.digitaloceanspaces.com"
    }

    bucket = "<your_bucket_name>"
    key    = "<state_file_name>"

    # Deactivate a few AWS-specific checks
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    region                      = "us-east-1"

    # Enable state locking with a lockfile
    use_lockfile = true
  }
}*/
