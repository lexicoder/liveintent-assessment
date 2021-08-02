output "aws_access_key_id" {
  description = "Access Key ID of the IAM user credentials"
  value       = module.partner_s3_bucket.aws_access_key_id
}

output "aws_secret_access_key" {
  description = "Access Key Secret of the IAM user credentials"
  value       = nonsensitive(module.partner_s3_bucket.aws_secret_access_key)
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.partner_s3_bucket.s3_bucket_name
}
