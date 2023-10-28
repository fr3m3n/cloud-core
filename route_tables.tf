# ==================================================================
# Scope: Route tables and their associations.
# Author: fr3m3n
# Date: 28.10.23
# Version: 1.0
# ==================================================================

# Public Route Table
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0" # For all traffic (represented by 0.0.0.0/0)
        gateway_id = aws_internet_gateway.igw.id # direct it to the specified Internet Gateway
    }

    tags = {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}




# Private Route Table
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0" # For all traffic (represented by 0.0.0.0/0)
        nat_gateway_id = aws_nat_gateway.private_nat_gateway.id # direct it to the specified NAT Gateway
    }

    tags = {
        Name = "Private Route Table"
    }
}
