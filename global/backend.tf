terraform {
  backend "s3" {
    bucket         = "CHANGEME-terraform"
    key            = "global/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = "true"
    profile        = "default"
  }
}
