# Terraform Workspace Template
Boilerplate for terraform workspaces inside a VS Code devcontainer. Tested with Docker Desktop (WSL) and includes tfswitch for selecting terraform version.

This includes dummy configuration to create a local file (in the current working directory) named *production.foo* or *development.foo* so that it can be tested without having to add any additional configuration yourself.

## Usage
### Prerequisties
- Docker Desktop
- VS Code (stable or insiders)
- Remote Containers extension

### Steps
1. Open this project in VS Code. The `.devcontainer` folder should be at the root.
2. CTRL+Shift+P, select "Remote-Containers: Reopen in Container"

At this point if it's your first time launching the container it may take a few minutes to build.

3. If the terminal wasn't automatically opened, right-click in the file explorer pane and select "Open in Integrated Terminal". 

From here you can install your expected version of terraform with `tfswitch`.

## Other Notes
`terraform workspace list` will show the full list of available workspaces. `terraform workspace new <envname>` to create more.

`terraform workspace select <envname>` to switch to a specific environment.

`./environments/` should include a .tfvars file for each workspace, with the filename *exactly* matching the workspace name e.g. for workspace *env-prod* the filename should be *env-prod.tfvars*.

`terraform init` to initialise the plan, downloading any required dependencies (in this test example it will download the *hashicorp/local* plugin)

`tf-ws.sh` is a wrapper for terraform that includes the appropriate *.tfvars* file for the workspace from the `./environments/` folder.

Example: 
```
root@host# terraform workspace list
  default
  env-dev
* env-prod
root@host# terraform workspace select env-prod
root@host# ./tf-ws.sh plan
```
will execute `terraform --var-file=environments/env-prod.tfvars plan`.

Executing `./tf-ws.sh apply` will execute the plan, in this case creating a dummy *.foo* file in the local directory.
