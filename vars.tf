# ==================================================================
# Scope: Input Variables
# Author: fr3m3n
# Date: 27.10.23
# Version: 1.0
# ==================================================================

variable "aws_region_id" {
    description = "Identifier for the AWS Region where resources will be provisioned."
    type = string
    default = "us-east-1"
    nullable = false
}

variable "image_id" {
    description = "ID of the Amazon Machine Image (AMI) to be used for provisioning EC2 instances. Recommended to use valid AMI IDs."
    type        = string
    default = "ami-0261755bbcb8c4a84" # Ubuntu Server 20.04 LTS
  
    validation {
        condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
        error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
}

variable "main_vpc_cidr" {
    description = "CIDR block for the primary Virtual Private Cloud (VPC). This defines the IP address range of the VPC."
    type = string
    default = "10.0.0.0/24"
    nullable = false
}

variable "public_subnets" {
    description = "A subnet within a Virtual Private Cloud (VPC) that has a route to the internet."
    type = string
    default = "10.0.0.128/26"
    nullable = false
}

variable "private_subnets" {
    description = "A subnet within a Virtual Private Cloud (VPC) that does NOT have a direct route to the internet."
    type = string
    default = "10.0.0.192/26"
    nullable = false
}

# ==================================================================