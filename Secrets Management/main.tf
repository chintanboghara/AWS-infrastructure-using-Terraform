// Define the region for AWS provider
provider "aws" {
  region = "ap-south-1"
}

// Configure Vault provider
provider "vault" {
  address         = "<VAULT_ADDRESS>:8200" // Replace <VAULT_ADDRESS> with the actual Vault server address
  skip_child_token = true

  auth_login {
    path = "auth/approle/login" // AppRole login path in Vault

    parameters = {
      role_id   = "<ROLE_ID>"   // Replace with your Vault AppRole Role ID
      secret_id = "<SECRET_ID>" // Replace with your Vault AppRole Secret ID
    }
  }
}

// Fetch secret data from Vault KV v2
data "vault_kv_secret_v2" "example" {
  mount = "kv"       // Replace with the correct mount path of your KV engine in Vault
  name  = "secret"   // Replace with the correct path to your secret in Vault
}

// Create an AWS EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90" // Replace with your desired AMI ID
  instance_type = "t2.micro"

  // Add tags to the instance
  tags = {
    Name   = "DemoEC2Instance"
    Secret = data.vault_kv_secret_v2.example.data["username"] // Replace "username" with the appropriate key from your secret
  }
}