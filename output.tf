output "s3bucket" {
  description = "Bucket ARN name"
  value = module.s3_bucket.s3_bucket_arn
}