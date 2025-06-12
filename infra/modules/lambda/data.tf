# O recurso de data é uma funcionalidade do Terraform para mencionar recursos existentes na cloud
# Nesse caso, a lambda será colocada dentro da VPC e subnets existentes
data "aws_vpc" "vpc_target" {
  filter {
    name   = "tag:Name" #Filtro por nome da VPC
    values = [var.vpc_name] # Nome do recurso existente na AWS
  }
}

data "aws_subnets" "private_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_target.id]
  }
}

data "aws_security_group" "lambda_sg" {
  filter {
    name   = "group-name"
    values = [var.security_group_name]
  }

  vpc_id = data.aws_vpc.vpc_target.id
}