terraform {
  backend "s3" {
    key    = "terraform.tfstate"
    region = "eu-central-1"
    bucket = "terraform-remote-state-bucket-lexicoder"
    dynamodb_table = "lexicoder-terraform-remote-state-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "partner_s3_bucket" {
  source       = "./modules/partner-s3-bucket"
  partner_name = "acme-enterprise"
}
