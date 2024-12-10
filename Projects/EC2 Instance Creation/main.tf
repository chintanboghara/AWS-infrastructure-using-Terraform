provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami           = "ami-0dee22c13ea7a9a67"
    instance_type = "t3.micro"
    subnet_id     = "subnet-0b4620689*f*f*2f5"
    key_name      = "EC2-key-pair"

    tags = {
        Name = "MyExampleInstance"
    }
}