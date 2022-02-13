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
  region = "ap-south-1"
}



module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "salprds3bucket"
  acl = "private"
  policy = {
    {
      "version" : "2013-10-17"

     }
  }

  versioning = {
    enabled = false
  }

module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4"

  trusted_role_arns = [
    "arn:aws:iam::326006462036:user/selloud",
     ]

  create_role = true

  role_name         = "custom"
  role_requires_mfa = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",

  ]
  number_of_custom_role_policy_arns = 1
  
}