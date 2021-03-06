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
      identifiers = ["arn:aws:iam::953729221938:root"]
    }
    
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::test4sal",
    ]
  }

}
