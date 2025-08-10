variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-3" # Osaka region
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket (random suffix added)"
  type        = string
  default     = "cinarra-mock"
}

