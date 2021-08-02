output "aws_access_key_id" {
  description = "Access Key ID of the IAM user credentials"
  value       = aws_iam_access_key.iam_access_key.id
}

output "aws_secret_access_key" {
  description = "Access Key Secret of the IAM user credentials"
  value       = aws_iam_access_key.iam_access_key.secret
}

output "s3_bucket_name" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}
