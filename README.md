### **Basic Commands**
- **`terraform init`**  
  Prepares the working directory for other commands by downloading the necessary provider plugins.

- **`terraform plan`**  
  Creates an execution plan, showing what actions Terraform will take to match the desired state.

- **`terraform apply`**  
  Applies the changes required to reach the desired state of the configuration.

- **`terraform destroy`**  
  Destroys all Terraform-managed infrastructure.

### **Configuration Management**
- **`terraform validate`**  
  Validates the configuration files for syntax errors or issues.

- **`terraform fmt`**  
  Formats Terraform files to adhere to consistent style conventions.

- **`terraform taint [resource_name]`**  
  Marks a resource for recreation during the next `terraform apply`.

- **`terraform untaint [resource_name]`**  
  Removes the taint from a resource.

### **State Management**
- **`terraform state list`**  
  Lists resources in the current Terraform state.

- **`terraform state show [resource_name]`**  
  Displays detailed information about a specific resource in the state.

- **`terraform state mv [source] [destination]`**  
  Moves resources within the state file.

- **`terraform state rm [resource_name]`**  
  Removes a resource from the Terraform state file without destroying it.

### **Workspaces**
- **`terraform workspace list`**  
  Lists all available workspaces.

- **`terraform workspace new [workspace_name]`**  
  Creates a new workspace.

- **`terraform workspace select [workspace_name]`**  
  Switches to the specified workspace.

- **`terraform workspace delete [workspace_name]`**  
  Deletes the specified workspace.

### **Debugging and Inspection**
- **`terraform show`**  
  Displays the Terraform state or a plan file.

- **`terraform output`**  
  Extracts and displays output variables from the state.

- **`terraform graph`**  
  Generates a visual graph of the resources.

- **`terraform console`**  
  Opens an interactive console for evaluating expressions and queries.

### **Advanced Commands**
- **`terraform import [address] [id]`**  
  Imports existing infrastructure into Terraform state.

- **`terraform lock`**  
  Locks the Terraform state file to prevent concurrent updates (when using backends that support locking).

- **`terraform unlock`**  
  Unlocks the state file.

- **`terraform providers`**  
  Displays the provider versions required by the configuration.
