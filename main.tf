terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Random suffix for unique bucket name
resource "random_id" "suffix" {
  byte_length = 3
}

# Create the bucket
resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_prefix}-${random_id.suffix.hex}"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
