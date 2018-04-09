# Terraform AWS Lambda API Gateway

### Features
- Uploads lambda zip bundle to AWS S3 during `terraform apply`
- Creates VPC with private and public subnets
- Deploys lambda function into private subnet (behind NAT Gateway)

## Example Usage
```hcl
module "lambda_api_gateway" {
  source               = "git@github.com:techjacker/terraform-aws-lambda-api-gateway"

  # tags
  project              = "todo-mvc"
  service              = "acme-corp"
  owner                = "Roadrunner"
  costcenter           = "acme-abc"

  # vpc
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
  nat_cidr             = ["10.0.5.0/24", "10.0.6.0/24"]
  igw_cidr             = "10.0.8.0/24"
  azs                  = ["eu-west-1a", "eu-west-1b"]

  # lambda
  lambda_zip_path      = "dist/todo-mvc.zip"
  lambda_handler       = "entry.run_app"
  lambda_runtime       = "python3.6"
  lambda_function_name = "HttpWebserver"

  # API gateway
  region               = "eu-west-1"
  account_id           = "123456789"
}
```

## Deployment
1. Run build process to create lambda zip bundle locally
2. Update terraform variable `lambda_zip_path` with path to zip bundle on local machine
3. Provide values for other required terraform variables
4. Create/Select terraform workspace on 1st/subsequent deployments
5. Deploy with `$ terraform apply`

### Example Deployment Script
```Shell
#!/usr/bin/env bash

if [[ ! -d .terraform ]]; then
  terraform init
fi
if ! terraform workspace list 2>&1 | grep -qi "$ENVIRONMENT"; then
  terraform workspace new "$ENVIRONMENT"
fi
terraform workspace select "$ENVIRONMENT"
terraform get
terraform apply \
  -var "lambda_zip_path=$LAMBDA_ZIP_PATH" \
  -var "region=$REGION" \
  -var "account_id=$ACCOUNT_ID"
```




