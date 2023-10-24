resource "aws_s3_bucket" "example" {
  bucket = "chisom-newest-bucket23" #enter a unique bucket name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
