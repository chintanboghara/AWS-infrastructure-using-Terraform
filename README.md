## Core Commands

- **`terraform init`**: Initializes a working directory containing Terraform configuration files. This command downloads the necessary provider plugins and sets up the backend.

- **`terraform plan`**: Creates an execution plan, showing what actions Terraform will take to reach the desired state specified in the configuration files.

- **`terraform apply`**: Applies the changes required to reach the desired state of the configuration. This command will prompt for approval before making any changes unless the `-auto-approve` flag is used.

- **`terraform destroy`**: Destroys all the resources managed by the Terraform configuration. This command will prompt for approval before destroying any resources unless the `-auto-approve` flag is used.

- **`terraform validate`**: Validates the configuration files in the current directory. It checks for syntax errors and ensures that the configuration is internally consistent.

- **`terraform fmt`**: Rewrites Terraform configuration files to a canonical format and style. This command helps maintain consistency across your codebase.

- **`terraform show`**: Displays the current state or a saved plan in a human-readable format.

- **`terraform output`**: Displays the output values from the Terraform state file.

- **`terraform refresh`**: Updates the state file with the real-world state of the infrastructure. This command is rarely used directly, as `terraform apply` and `terraform plan` automatically refresh the state.

## State Management Commands

- **`terraform state list`**: Lists all the resources in the Terraform state.

- **`terraform state show <resource>`**: Shows the attributes of a single resource in the Terraform state.

- **`terraform state pull`**: Pulls the current state and outputs it to stdout.

- **`terraform state push`**: Updates the remote state with a local state file.

- **`terraform state mv`**: Moves an item in the state, which can be useful for refactoring.

- **`terraform state rm`**: Removes an item from the state, which can be useful for cleaning up state files.

- **`terraform import <resource> <id>`**: Imports an existing resource into the Terraform state.

## Workspace Commands

- **`terraform workspace new <name>`**: Creates a new workspace.

- **`terraform workspace select <name>`**: Switches to the specified workspace.

- **`terraform workspace list`**: Lists all workspaces.

- **`terraform workspace delete <name>`**: Deletes the specified workspace.

## Utility Commands

- **`terraform version`**: Displays the current version of Terraform and all installed providers.

- **`terraform get`**: Downloads and installs modules needed for the configuration.

- **`terraform graph`**: Generates a visual representation of the Terraform resource graph.

- **`terraform taint <resource>`**: Marks a resource as tainted, forcing it to be destroyed and recreated on the next `terraform apply`.

- **`terraform untaint <resource>`**: Removes the taint from a resource.

## Advanced Commands

- **`terraform force-unlock <lock-id>`**: Manually unlocks the state for the specified lock ID.

- **`terraform console`**: Launches an interactive console for evaluating Terraform expressions.

- **`terraform providers`**: Displays information about the providers used in the configuration.

- **`terraform state replace-provider`**: Replaces the provider in the state file.

## Environment Variables

- **`TF_LOG`**: Sets the log level (e.g., `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`).

- **`TF_VAR_<variable_name>`**: Sets a Terraform variable from the environment.

- **`TF_CLI_ARGS`**: Passes additional arguments to Terraform commands.

- **`TF_IN_AUTOMATION`**: Indicates that Terraform is running in an automated environment, which can suppress certain prompts.
