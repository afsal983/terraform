
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = var.MyRegion
}



/* Create iam user */

module "iam_user" {
  source  = "terraform-aws-iam/modules/iam-user"
  version = "4.13.1"


  create_user = true
  name = "nabeel"
  password_length = 12
  create_iam_access_key = true
  
}