# ==================================================================
# Scope: Provider Configuration
# Author: fr3m3n
# Date: 28.10.23
# Version: 1.0
# ==================================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.aws_region_id}"
}