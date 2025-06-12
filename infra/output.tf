# Os outputs definidos aqui devem seguir os mesmos nomes que são definidos no módulo
# Ex: Se no módulo o nome do output é lambda_function_name, aqui a variável value recebe module.lambda.lambda_function_name
output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}