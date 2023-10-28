# ==================================================================
# Scope: Cloud Infrastructure
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

# Public Subnet
resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnet
    map_public_ip_on_launch = true # Instances launched into the subnet should be assigned a public IP address.
    availability_zone       = "${var.aws_region_id}a" # Example: us-east-1a
    
    tags = {
        Name = "Public Subnet"
    }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.private_subnet
    map_public_ip_on_launch = false
    availability_zone       = "${var.aws_region_id}a" # Example: us-east-1a
    
    tags = {
        Name = "Private Subnet"
    }
}

# Internet gateway for public subnet to reach the internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Main IGW"
  }
}