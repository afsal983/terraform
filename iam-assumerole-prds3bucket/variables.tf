variable "MyRegion" {
    type = string
    default  = "ap-south-1"
}

variable "availability_zone_names" {
     type = list(string)
     default = [ "ap-south-1a"]
}

data "aws_iam_policy_document" "bucket_policy" {
  
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      module.s3_bucket.s3_bucket_arn,
      "{module.s3_bucket.s3_bucket_arn}/*",
    ]
  }

}
