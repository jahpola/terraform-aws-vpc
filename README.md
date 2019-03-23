# terraform-aws-vpc

[![Sponsored](https://img.shields.io/badge/chilicorn-sponsored-brightgreen.svg)](http://spiceprogram.org/oss-sponsorship/)

A generic Terraform AWS VPC setup. There are two directories: 
- a network directory containing setup for VPC. 
- a global directory contains global settings (s3, alerts, iam, bastion etc)

## Setup

1. AWS account
2. AWS profile
3. Change profile in Terraform files
4. Check S3 state bucket names
5. Replace all CHANGEME's to correct values
5. terraform init/plan/apply in network
6. terraform init/plan/apply in global

## Databases

The directory databases contains database setup. By purpose it is separate from environment directories for blast radius&damage control. 

## Environments

Each environment (development/production/staging) contains the env specific setup. The VPC data is shared via remote state. The actual services are called from modules directory or github repo.