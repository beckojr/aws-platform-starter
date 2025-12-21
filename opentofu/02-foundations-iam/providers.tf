terraform {
  backend "s3" {
    bucket         = "pltfrm-tofu-mgmt-state-w2ynkcoz"
    key            = "pltfrm/mgmt/foundations-iam.tfstate"
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

provider "aws" {
  alias  = "hub"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${var.hub_account_id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias  = "platform"
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${var.platform_account_id}:role/OrganizationAccountAccessRole"
  }
}
