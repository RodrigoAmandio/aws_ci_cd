output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.lambda.arn
}