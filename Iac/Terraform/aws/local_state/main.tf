terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "Project_1" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  subnet_id     = "subnet-05314c4b688036a12"
  associate_public_ip_address = true

  tags = {
    Name = "Terraform_Demo"
  }
}
