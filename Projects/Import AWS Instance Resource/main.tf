provider "aws" {
  region = "ap-south-1"
}

import {
  id = "i-0********ca7baadd"

  to = aws_instance.example

}
