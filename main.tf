terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  cloud {
    organization = "lukkas-lukkas"

    workspaces {
      name = "projectX"
    }
  }
}