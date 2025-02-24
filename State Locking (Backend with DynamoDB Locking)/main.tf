provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami           = "ami-0dee22c13ea7a9a67"
    instance_type = "t2.micro"
    subnet_id     = "subnet-0b4620689*f*f*2f5"
    key_name      = "EC2-key-pair"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "example-s3-bucket-iac-terraform"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}