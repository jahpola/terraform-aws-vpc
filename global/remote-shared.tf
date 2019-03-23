data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket  = "CHANGEME-terraform"
    key     = "network/terraform.tfstate"
    region  = "eu-west-1"
    profile = "default"
  }
}
