provider "aws" {
  region = ap-south-1
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type        = map(string)

  default = {
    "dev"   = "t2.micro"
    "stage" = "t2.small"
    "prod"  = "t2.nano"
  }
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
