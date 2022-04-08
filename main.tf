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
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = "t2.micro"
  user_data = <<-EOF
    #!/bin/bash
    cd /home/ubuntu
    echo "<h1>Ola mundo. Feito com terraform<h1>" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF
  tags = {
    Name = "Instancia com teste 522"
  }
}