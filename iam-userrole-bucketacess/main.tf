
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
  source  = "github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user"


  create_user = true
  name = "nabeel"
  password_length = 12
  create_iam_access_key = true
  
}