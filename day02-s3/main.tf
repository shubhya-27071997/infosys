resource "aws_s3_bucket" "example" {
  bucket = "classmateeeio"  # Replace with your desired bucket name

  versioning {
    enabled = true  # Enables versioning
  }
}


#In day 2 we learn that we create a bucket in s3 first 
#and we check statefile after that I update version and check statfile thier version is enble show


