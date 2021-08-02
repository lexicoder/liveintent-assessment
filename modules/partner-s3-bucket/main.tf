resource "aws_iam_user" "iam_user" {
  name = "${var.partner_name}-partner"
  tags = var.resource_tags
}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.partner_name}-partner-lexicoder"
  acl    = "private"

  tags = var.resource_tags
}

resource "aws_iam_policy" "iam_policy" {
  description = "IAM policy for partner bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.s3_bucket.arn}"
      },
      {
        Action = [
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.s3_bucket.arn}/*"
      },
      {
        Action = [
          "s3:ListBucket"
        ]
        Effect   = "Deny"
        Resource = "${aws_s3_bucket.s3_bucket.arn}"
        "Condition" = {
          "StringLike" = {
            "s3:prefix" = "stats/*"
          }
        }
      },
      {
        Action = [
          "s3:GetObject"
        ]
        Effect = "Deny"
        Resource = [
          "${aws_s3_bucket.s3_bucket.arn}/stats/*"
        ]
      },
      {
        Action = [
          "s3:PutObject",
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.s3_bucket.arn}/upload/*"
      }
    ]
  })

  tags = var.resource_tags
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
