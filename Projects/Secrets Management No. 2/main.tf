# Define AWS Provider with parameterized region
provider "aws" {
  region = var.aws_region
}

# Define Vault Provider with parameterized address and authentication details
provider "vault" {
  address         = var.vault_address
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

# Fetch secret from Vault KV v2
data "vault_kv_secret_v2" "example" {
  mount = var.vault_kv_mount      # The KV engine mount point
  name  = var.vault_secret_name  # The name of the secret in Vault
}

# Create an EC2 instance with the secret from Vault
resource "aws_instance" "my_instance" {
  ami           = var.ami_id       # AMI ID for the EC2 instance
  instance_type = var.instance_type  # Instance type for the EC2 instance

  tags = {
    Name   = "DemoEC2Instance"                             # Tag for the instance name
    Secret = data.vault_kv_secret_v2.example.data["username"]  # Inject Vault secret as a tag
  }
}

# Variables for reusability and flexibility
variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "vault_address" {
  description = "Vault server address"
  type        = string
}

variable "vault_role_id" {
  description = "AppRole Role ID for Vault authentication"
  type        = string
}

variable "vault_secret_id" {
  description = "AppRole Secret ID for Vault authentication"
  type        = string
}

variable "vault_kv_mount" {
  description = "Mount point for the KV secret engine in Vault"
  type        = string
  default     = "kv"
}

variable "vault_secret_name" {
  description = "Name of the secret in Vault to retrieve"
  type        = string
  default     = "secret"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b0d53c279acc90"  # Example AMI ID
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

# Optional outputs for verification
output "ec2_instance_id" {
  description = "The ID of the EC2 instance created"
  value       = aws_instance.my_instance.id
}

output "vault_secret" {
  description = "Retrieved secret from Vault"
  value       = data.vault_kv_secret_v2.example.data["username"]
}