module "bastion-instance-sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "bastion-sg"
  description = "Bastion Access SG"

  vpc_id = "${data.terraform_remote_state.network.vpc_id}"

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "${var.home_ip}"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "${var.home_ip}"
    },
  ]

  egress_with_cidr_blocks = [
    {
      rule        = "all-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Terraform = "True"
  }
}

resource "aws_security_group" "from-nat" {
  name        = "from-nat"
  description = "Allow access from NAT GW ips"

  vpc_id = "${data.terraform_remote_state.network.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${formatlist("%s/32", data.terraform_remote_state.network.nat_public_ips)}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${formatlist("%s/32", data.terraform_remote_state.network.nat_public_ips)}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags = {
    Name      = "from-nat"
    Terraform = "True"
  }
}
