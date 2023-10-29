# ==================================================================
# Scope: Cloud Infrastructure
# Author: fr3m3n
# Date: 28.10.23
# Version: 1.0
# ==================================================================


# EC2: Public
resource "aws_instance" "ec2_public" {
    ami             = "${var.image_id}"
    instance_type   = "t2.micro"
    subnet_id       = aws_subnet.public_subnet.id
    count           = var.ec2_public_count

    tags = {
        Name = "${var.ec2_public_name}-${count.index + 1}"
    }
}

# EC2: Private
resource "aws_instance" "ec2_private" {
    ami           = "${var.image_id}"
    instance_type = "t2.micro"
    subnet_id       = aws_subnet.private_subnet.id
    count         = var.ec2_private_count

    tags = {
        Name = "${var.ec2_private_name}-${count.index + 1}"
    }
}


# S3: Storage
resource "aws_s3_bucket" "s3" {
    bucket = "${var.s3_name}-${count.index + 1}"
    count  = var.s3_count

    tags = {
        Name        = "CloudCore_bucket_${count.index + 1}"
        Environment = "Dev"
    }
}