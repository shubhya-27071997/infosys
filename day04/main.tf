resource "aws_s3_bucket" "dada" {
  bucket = "shubhiilovessdivvvvshub"
}
resource "aws_s3_bucket_versioning" "versioning_dada" {
    bucket = aws_s3_bucket.dada.id
    versioning_configuration {
      status = "Enabled"

    }
  
}