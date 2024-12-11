terraform {
  backend "s3" {
    bucket = "example-s3-bucket-iac-terraform"
    key    = "chintanboghara/terraform.tfstate"
    region = "ap-south-1"
  }
}