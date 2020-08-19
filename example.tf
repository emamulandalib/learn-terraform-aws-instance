terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "Cromonix"

    workspaces {
      name = "learn-terraform-aws-instance"
    }
  }
}

provider "aws" {
  profile    = "personal"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}