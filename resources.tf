resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.AWS_BUCKET
  acl    = "private"
}
