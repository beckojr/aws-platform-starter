terraform {
  backend "s3" {
    bucket = "pltfrm-tofu-mgmt-state-w2ynkcoz"
    # key    = "pltfrm/mgmt"
    key            = "pltfrm/mgmt/foundations-accounts.tfstate"
    dynamodb_table = "pltfrm-tofu-state-lock"
  }
  required_providers {
    aws = {
      version = "~>6.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
