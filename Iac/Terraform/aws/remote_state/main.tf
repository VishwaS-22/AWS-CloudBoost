terraform {
   backend "s3" {
     bucket         = "286201236151-terraform-states"
     key            = "Terraform/aws/remote-state/terraform.tfstate"
     region         = "us-east-1"
     encrypt        = true
  }

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

data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "terraform_state" {
  # With account id, this S3 bucket names can be *globally* unique.
  
  bucket = "${local.account_id}-terraform-states"

  # Enable versioning so we can see the full revision history of our state files  
  
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
