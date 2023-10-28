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
    # CIDR block is "10.0.0.0/24", -> [256 IP addresses]
    default = "10.0.0.0/24"
    nullable = false
}

variable "public_subnet" {
    description = "A subnet within a Virtual Private Cloud (VPC) that has a route to the internet."
    type = string
    nullable = false
    
    # IP addresses ranging from "10.0.0.128" to "10.0.0.191", -> [64 IP addresses]
    default = "10.0.0.128/26"
    # Reserved Addresses:
    #   10.0.0.128: Network address
    #   10.0.0.129: Reserved by AWS for the VPC router
    #   10.0.0.130: Reserved by AWS for DNS
    #   10.0.0.131: Reserved by AWS for future use
    #   10.0.0.191: Broadcast address
    # Usable IP Addresses:
    #   10.0.0.132 to 10.0.0.190
    #   Total Usable: 59
}

variable "private_subnet" {
    description = "A subnet within a Virtual Private Cloud (VPC) that does NOT have a direct route to the internet."
    type = string
    nullable = false

    # IP addresses ranging from "10.0.0.192" to "10.0.0.255", -> [64 IP addresses]
    default = "10.0.0.192/26"
    # Reserved Addresses:
    #   10.0.0.192: Network address
    #   10.0.0.193: Reserved by AWS for the VPC router
    #   10.0.0.194: Reserved by AWS for DNS
    #   10.0.0.195: Reserved by AWS for future use
    #   10.0.0.255: Broadcast address
    # Usable IP Addresses:
    #   10.0.0.196 to 10.0.0.254
    #   Total Usable: 59
}

# ==================================================================