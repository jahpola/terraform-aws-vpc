resource "aws_eip" "nat" {
  count = 3

  vpc = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  external_nat_ip_ids    = ["${aws_eip.nat.*.id}"]
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  reuse_nat_ips          = true

  enable_vpn_gateway       = false
  enable_dynamodb_endpoint = true
  enable_s3_endpoint       = true

  tags = {
    Terraform   = "True"
    Environment = "Network"
  }
}

resource "aws_db_subnet_group" "rds-private-subnet" {
  name        = "rds-private-subnet"
  description = "RDS private subnet group"

  subnet_ids = ["${module.vpc.private_subnets}"]
}
