terraform {
  required_version = ">= 1.3.0" # Versão requerida do Terraform neste código

  required_providers {
    aws = {
        # Versão requerida do provider e onde o Terraform irá baixá-lo
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
  }

  # Local onde será salvo o arquivo terraform.tfstate, onde todos os recursos geridos serão guardados
  backend "s3" {
    bucket = "rodrigo-amandio-curso-terraform" # Não se permite variáveis neste ponto
    key    = "aws-cicd-lambda/terraform.tfstate"
    region = "us-east-1" # Não se permite variáveis neste ponto
  }

}

# No Terraform, o provider é um plugin que o Terraform usa para interagir com um sistema externo (GCP, AWS, Azure)
# Aqui é declarado em qual região o provider estará e quais tags serão aplicadas a ele
provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }
}

module "lambda" {
  source = "./modules/lambda" # Módulo local

  function_name       = var.function_name
  handler             = var.handler
  runtime             = var.runtime
  lambda_package_path = "${path.module}/lambda-structure/lambda.zip" # Este caminho ainda não existe no repositório. Mas quando for feito o deploy via CD, haverá um passo na esteira anterior ao terraform para zipar a pasta app exatamente neste endereço

  role_name           = var.role_name
  policy_name         = var.policy_name

  vpc_name            = var.vpc_name
  security_group_name = var.security_group_name

  tags = var.tags
}