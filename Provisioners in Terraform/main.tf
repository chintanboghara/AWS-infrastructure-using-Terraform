provider "aws" {
  region = "ap-south-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_key_pair" "example" {
  key_name   = "EC2-key-pair-for-terraform"
  public_key = file("/home/codespace/.ssh/id_rsa.pub")
}

resource "aws_vpc" "vpc-for-terraform" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet-for-terraform" {
  vpc_id                  = aws_vpc.vpc-for-terraform.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw-for-terraform" {
  vpc_id = aws_vpc.vpc-for-terraform.id
}

resource "aws_route_table" "RT-for-terraform" {
  vpc_id = aws_vpc.vpc-for-terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-for-terraform.id
  }
}

resource "aws_route_table_association" "rta-for-terraform" {
  subnet_id      = aws_subnet.subnet-for-terraform.id
  route_table_id = aws_route_table.RT-for-terraform.id
}

resource "aws_security_group" "Sg-for-terraform" {
  name   = "Sg-for-terraform"
  vpc_id = aws_vpc.vpc-for-terraform.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sg-for-terraform"
  }
}

resource "aws_instance" "EC2-Ubuntu-for-terraform" {
  ami                    = "ami-053b12d3152c0cc71"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.Sg-for-terraform.id]
  subnet_id              = aws_subnet.subnet-for-terraform.id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/codespace/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3-pip",
      "sudo pip3 install flask",
      "cd /home/ubuntu",
      "sudo python3 app.py &",
    ]
  }
}