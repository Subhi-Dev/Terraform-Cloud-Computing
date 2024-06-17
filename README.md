This is a [Next.js](https://nextjs.org/) project with a Terraform script to deploy it to AWS Amplify

## Prerequisites

 - Terraform CLI 1.2.0 or above
 - AWS account
 - Github account
 - [Github Personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)

## Getting Started

First, fork this repository to your Github account

Next, clone the code and run the following commands in the main directory, and substitute the variables with your real values
```bash
export TF_VAR_REPO=Github Repo URL # Might be SET if you are on windows
export TF_VAR_TOKEN=Github Personal Token
terraform apply
```
WARNING: Make sure your Personal Access Token Doesn't make it to the public repository, avoid pushing any sensitive tokens.

NOTE: The AWS Amplify Dashboard will show a warning "Update required", which is an option to update to the Github app instead of the token which isn't supported in terraform. Otherwise your app will continue to function normally.
