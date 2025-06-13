# Este recurso retorna informações sobre identificadores das credenciais que o Terraform está utilizando
# Retorna metadatos úteis da AWS como user ou role, como account_id, arn e user_id
data "aws_caller_identity" "current" {}