# path.module é uma built-in do terraform que retorna o diretório onde está o módulo, neste caso, o arquivo locals.tf
locals {
  trust_policy_path = "${path.module}/../../iamsr/trust/trust-lambda.json"
  exec_policy_path  = "${path.module}/../../iamsr/policy/policy-lambda.json"
}

# ${path.module} points to infra/module/lambda, and:

# ../../ goes to infra/

# From there, you go into iamsr/trust/ or iamsr/policy/