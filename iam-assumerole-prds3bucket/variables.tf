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
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values = [
        "",
        "home/",
        "home/&{aws:username}/",
      ]
    }
  }

}
