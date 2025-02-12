resource "aws_cloudwatch_log_group" "eks_logs" {
  name              = "/aws/eks/${project}"
  retention_in_days = 30
}

resource "aws_iam_policy" "eks_logging" {
  name        = "EKSLoggingPolicy"
  description = "IAM policy for EKS CloudWatch"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_logging_attach" {
  policy_arn = aws_iam_policy.eks_logging.arn
  role       = module.eks.cluster_iam_role_name
}