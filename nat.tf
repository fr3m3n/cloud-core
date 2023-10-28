# ==================================================================
# Scope: NAT Gateway and Elastic IP configurations
# Author: fr3m3n
# Date: 28.10.23
# Version: 1.0
# ==================================================================

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "NAT EIP"
  }
}

resource "aws_nat_gateway" "private_nat_gateway" {
    # (Optional) The Allocation ID of the Elastic IP address for the NAT Gateway
    allocation_id = aws_eip.nat_eip.id 

    # (Required) The Subnet ID of the subnet in which to place the NAT Gateway.
    subnet_id = aws_subnet.public_subnet.id
    
    tags = {
        Name = "Private Subnet NAT Gateway"
    }
}

