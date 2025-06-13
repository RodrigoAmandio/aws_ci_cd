variable "function_name" {
    type            = string
    description     = "Nome da lambda que será criada na AWS"
    default         = null
}

variable "handler" {
    type            = string
    description     = "Handler da lambda"
    default         = null
}

variable "runtime" {
    type            = string
    description     = "Runtime para a função"
    default         = null
}

variable "role_name" {
    type            = string
    description     = "Nome da role que será utilizada pela Lambda"
    default         = null
}

variable "policy_name" {
    type            = string
    description     = "Nome da policy que será utilizada pela role"
    default         = null
}

variable "vpc_name" {
    type            = string
    description     = "Nome da VPC em que os recursos serão alocados"
    default         = null
}

variable "security_group_name" {
    type            = string
    description     = "Nome do Security Group em que os recursos serão alocados na VPC"
    default         = "default"
}

variable "tags" {
  type = map(string)
  description = "Tags comuns aplicadas aos recursos"
  default = {}
}

variable "tfstate_bucket" {
    type            = string
    description     = "Nome do bucket onde ficará salvo o arquivo de state do Terraform"
    default         = null
}

variable "region" {
    type            = string
    description     = "Nome da região onde os recursos estão alocados"
    default         = "us-east-1"
}

