# Uma forma de declarar variáveis é usando {}
# Trata-se de uma variável sem valor e tipo default, cujo valor é esperado pelo Terraform via CLI, tfvars ou informado dentro do módulo do recurso a ser criado.

variable "function_name" {}
variable "handler" {}
variable "runtime" {}
variable "lambda_package_path" {}

variable "role_name" {}
variable "policy_name" {}

variable "vpc_name" {}
variable "security_group_name" {}

variable "tags" {
  type = map(string)
  default = {}
}
