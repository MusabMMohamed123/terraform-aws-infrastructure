variable "aws_s3_bucket" {
  type = string
  default = "musab-aws-pipeline-project5343"
  validation {
    condition     = can(regex("^([a-z0-9]{1}[a-z0-9-]{1,61}[a-z0-9]{1})$", var.aws_s3_bucket))
    error_message = "Bucket Name must not be empty and must follow S3 naming rules."
  }
}