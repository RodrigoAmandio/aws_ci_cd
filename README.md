# 📌 Projeto - Infraestrutura e Aplicação Serverless

Este repositório contém a implementação de uma aplicação **Serverless em AWS Lambda**, juntamente com a **infraestrutura como código (Terraform)** e um pipeline de **CI/CD via GitHub Actions**.  

A solução foi estruturada para garantir **padronização, automação e escalabilidade** no ciclo de desenvolvimento e deploy.  

---

## 🗂 Estrutura do Repositório

```bash
.
├── .coveragerc               # Configuração de cobertura de testes
├── .gitignore                # Arquivos/diretórios ignorados no Git
├── .github/                  # Configurações de GitHub Actions
│   ├── actions/              # Ações customizadas
│   │   └── cached_dependencies/action.yml
│   └── workflows/            # Pipelines CI/CD
│       ├── ci_workflow.yml
│       ├── create_pull_request.yml
│       └── deploy.yml
├── app/                      # Código da aplicação (Lambda)
│   ├── lambda_function.py
│   ├── requirements.txt
│   ├── tests/
│   │   └── test_app.py
│   └── src/                  # (pasta para código adicional)
└── infra/                    # Infraestrutura como código (Terraform)
    ├── main.tf               # Definições principais
    ├── variables.tf          # Variáveis de entrada
    ├── data.tf               # Data sources (recursos existentes)
    ├── output.tf             # Saídas
    ├── iamsr/                # Políticas e trust policies IAM
    │   ├── policy/policy-lambda.json
    │   └── trust/trust-lambda.json
    ├── inventories/          # Inventários por ambiente
    │   ├── dev/
    │   ├── hom/
    │   └── prod/
    └── modules/              # Módulos Terraform reutilizáveis
```

---

## ⚙️ Tecnologias Utilizadas

- **AWS Lambda** – execução da função serverless  
- **Terraform** – gerenciamento da infraestrutura (IAM, ambientes, módulos)  
- **GitHub Actions** – CI/CD para build, testes e deploy  
- **Python** – linguagem da aplicação Lambda  
- **Pytest / Coverage** – testes unitários e cobertura  

---

## 🚀 Como Executar o Projeto

### 1. Pré-requisitos
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- [Python 3.x](https://www.python.org/downloads/)  
- AWS CLI configurado com credenciais válidas  
- Permissões adequadas para criar recursos IAM e Lambda  

### 2. Configuração da Infraestrutura
Entre na pasta `infra/` e execute:  

```bash
terraform init
terraform workspace select dev   # ou hom/prod
terraform plan
terraform apply
```

### 3. Executando a Aplicação Localmente
Na pasta `app/`:  

```bash
pip install -r requirements.txt
python lambda_function.py
```

> A função Lambda pode ser empacotada e implantada via pipeline (`deploy.yml`) no GitHub Actions.

---

## 🧪 Testes

Para realizar a validação do código com black e isort:

```bash
isort ./app
```
```bash
black ./app
```

Para rodar os testes unitários do arquivo lambda_function.py:

```bash
coverage run -m unittest discover app/tests/
```

```bash
coverage report
```

```bash
coverage html
```

O relatório de cobertura é configurado via `.coveragerc`.

---

## 🔄 CI/CD

Todas as novas branches devem ser iniciadas com **"feature/"** para que os fluxos sejam automaticamente iniciados.

O repositório utiliza **GitHub Actions** com os seguintes fluxos:  

- `ci_workflow.yml` → Avalia a formatação de código de acordo com os padrões das bicliotecas black e isort, checa se o percentual de cobertura do código lambda_function.py está acima de 80% e por último, faz a validação do código Terraform.

- `create_pull_request.yml` → Cria automaticamente um Pull Request para a branch develop.

- `deploy.yml` → deploy automatizado da Lambda na AWS após merge do Pull Request.

---

