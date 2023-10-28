# ==================================================================
# Scope: Virtual Private Cloud config
# Author: fr3m3n
# Date: 28.10.23
# Version: 1.0
# ==================================================================

# Virtual Private Cloud
resource "aws_vpc" "main" { 

    cidr_block = var.main_vpc_cidr
    instance_tenancy = "default" # The instance is on "shared" hardware.

    # (optional)
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = "Main VPC"
    }
}

# Internet gateway for public subnet to reach the internet
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "Main IGW"
    }
}