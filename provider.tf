terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  cloud {
    organization = "lukkas-lukkas"

    workspaces {
      name = "projectX"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}
