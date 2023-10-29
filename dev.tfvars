aws_region_id   = "us-east-1"
image_id        = "ami-0261755bbcb8c4a84" # Ubuntu Server 20.04 LTS

main_vpc_cidr   = "10.0.0.0/24"
public_subnets  = "10.0.0.128/26"
private_subnets = "10.0.0.192/26"

ec2_public_count    = 2
ec2_private_count   = 1
s3_count            = 2

ec2_name        = "ec2-cloud-core"
s3_name         = "s3-cloud-core"