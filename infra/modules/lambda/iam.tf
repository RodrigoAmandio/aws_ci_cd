# Creates an IAM Role for the Lambda function with a trust policy that allows AWS Lambda to assume it
resource "aws_iam_role" "lambda_exec_role" {
  name = var.role_name

  # Loads the trust policy JSON file which defines who can assume this role (usually "lambda.amazonaws.com")
  assume_role_policy = file(local.trust_policy_path)
}

# Creates a custom IAM Policy defining what the Lambda function is allowed to do (e.g., logs, VPC access)
resource "aws_iam_policy" "lambda_exec_policy" {
  name        = var.policy_name
  description = "IAM policy for Lambda execution"

  # Loads the permissions policy from a JSON file (e.g., allow CloudWatch Logs, VPC, S3, etc.)
  policy      = file(local.exec_policy_path)
}

# Attaches the custom policy to the Lambda execution role, enabling the role to use the defined permissions
resource "aws_iam_role_policy_attachment" "lambda_exec_policy_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_exec_policy.arn
}
