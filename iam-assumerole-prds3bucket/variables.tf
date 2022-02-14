variable "MyRegion" {
    type = string
    default  = "ap-south-1"
}

variable "availability_zone_names" {
     type = list(string)
     default = [ "ap-south-1a"]
}

data "aws_iam_policy_document" "bucket_policy" {
  
}
variable "Bucket_policy" {
 
  {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Principal": {},
			"Effect": "Allow",
			"Action": [],
			"Resource": []
		}
	]
}

}