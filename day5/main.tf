resource "aws_s3_bucket" "dada" {
  bucket = "shubhiilovessdivvvvshubdada"
}
resource "aws_s3_bucket_versioning" "versioning_dada" {
    bucket = aws_s3_bucket.dada.id
    versioning_configuration {
      status = "Enabled"

    }
 # lifecycle {
 #   prevent_destroy = true
 # }
 # lifecycle {
 #   ignore_changes = [ tags ]
 # }
 # lifecycle {
 #   create_before_destroy = true
 # }
