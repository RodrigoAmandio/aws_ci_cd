resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.lambda_package_path # .zip do local onde o código da lambda está em formato zip

  vpc_config {
    subnet_ids         = data.aws_subnets.private_subnet.ids
    security_group_ids = [data.aws_security_group.lambda_sg.id]
  }

  tags = var.tags
}
