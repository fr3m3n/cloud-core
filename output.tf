output "ec2_public_ip_addresses" {
    value       = [for i in aws_instance.ec2_public : i.public_ip]
    description = "Public IP addresses of the created instances"
}

output "ec2_private_ip_addresses" {
    value       = [for i in aws_instance.ec2_private : i.private_ip]
    description = "Public IP addresses of the created instances"
}

output "s3_bucket_arn" {
    # value       = aws_s3_bucket.s3.arn
    value       = [for i in aws_s3_bucket.s3 : i.arn]
    description = "ARN of the created S3 buckets"
}