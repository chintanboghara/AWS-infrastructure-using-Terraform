**Initialize Terraform:**
   Once have the `main.tf` file in repo, open a terminal/command prompt and navigate to the directory containing `main.tf` file.

   Run the following command to initialize Terraform:
   ```bash
   terraform init
   ```

**Run the Terraform Plan Command:**
   After initializing Terraform, Run the `terraform plan` command to generate the `generated_resources.tf` file. Use the following command:
   ```bash
   terraform plan-generate-config-out=generated_resources.tf
   ```

   This will create a new file `generated_resources.tf`, which will contain the configuration of all the existing resources as determined by Terraform's state and plan.