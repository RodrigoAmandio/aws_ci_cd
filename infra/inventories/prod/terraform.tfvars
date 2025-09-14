function_name       = "ci_cd_lambda_creation"
handler             = "lambda_function.lambda_handler" # Ex: python_file.main_function
runtime             = "python3.12" # Versão do Runtime
role_name           = "cicd_project_lambda_exec_role"
policy_name         = "cicd_project_lambda_exec_policy"
vpc_name            = "vpc-terraform"
security_group_name = "default"
tags                = {
    "tag_environment"   = "prod" # Altere conforme o ambiente
    "tag_owner"         = "Rodrigo Amandio"
    "tag_managed_by"    = "Terraform"
}