terraform {  
    required_providers {    
        aws = {      
            source  = "hashicorp/aws"
            version = "~> 4.16"    
        }
    }  
    required_version = ">= 1.2.0"
}
provider "aws" {
    region  = "us-east-1"
}
variable "REPO" {
  type = string
}
variable "TOKEN" {
  type = string
}
resource "aws_amplify_app" "terraform_website" {
  name       = "terraform_website"
  repository = var.REPO
  access_token = var.TOKEN
  platform = "WEB_COMPUTE"
  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci --cache .npm --prefer-offline
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: .next
        files:
          - '**/*'
      cache:
        paths:
          - .next/cache/**/*
          - .npm/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.

}
resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.terraform_website.id
  branch_name = "main"

  framework = "Next.js - SSR"
  stage     = "PRODUCTION"
}

resource "aws_amplify_webhook" "main" {
  app_id      = aws_amplify_app.terraform_website.id
  branch_name = aws_amplify_branch.main.branch_name
  description = "triggermaster"
}