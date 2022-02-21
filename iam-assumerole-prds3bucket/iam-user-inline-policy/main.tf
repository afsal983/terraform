
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"
}

/* Select the region using the variable defined in variables.tf file */

provider "aws" {
  profile = "default"
  region = var.MyRegion
}



/* Create iam user with password encrypted using pgp public key stored in keybase*/

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  name          = "nabeel"
  force_destroy = true
  pgp_key = "keybase:afsal983"
  password_reset_required = false

}

module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 4"
  
  name        = "sal_policy"
  path        = "/"
  description = "user policy"
  
  policy = <<EOF
{
	"Version": "2012-10-17", 
	"Statement":[
		{
			"Sid": "AllowGroupToSeeBucketListInTheConsole",
			"Action": ["s3:ListAllMyBuckets"], 
			"Effect": "Allow", 
			"Resource": ["arn:aws:s3:::*"]
		}
	]
}

EOF
}

resource "aws_iam_user_policy_attachment" "user_specific_policy" {
  user       = module.iam_user.iam_user_name
  policy_arn = module.iam_policy.arn
}