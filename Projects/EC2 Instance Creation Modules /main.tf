provider "aws" {
  region = ap-south-1
}

module "aws_instance" {
  source = "../EC2 Instance Creation Advanced"
  ami_value = ""
  instance_type_value = ""
  subnet_id_value = ""
}

module "ec2-instance_example_complete" {
  source  = "terraform-aws-modules/ec2-instance/aws//examples/complete"
  version = "5.7.1"
}