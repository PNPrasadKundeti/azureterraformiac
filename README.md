Infrastructure in Azure using Terraform

{ Terraform #iaC + Azure Learning } - 2

Code once + Update + Deploy

*** Create a Ubuntu Linux VM with infrastructure in Azure using Terraform ***
Terraform allows you to define and create complete infrastructure deployments in Azure with help of Azure documentation
Thanks Ravi for the kickstart, very much needed.

Build and deploy the infrastructure
- Configure the Microsoft Azure Provider
- Create a resource group
- Create a virtual network
- Create subnet and create a public IP address
- Create Network Security Group and rule
- Create a network interface and connect to NSG
- Create an SSH key
- Create a virtual machine
- VM data disk attachment added

terraform init :  ensures that Terraform has all the prerequisites to build your template in Azure.

terraform plan  : Compares the requested resources to the state information saved by Terraform and then outputs the planned execution. The Azure resources aren't created at this point.

terraform apply : If everything looks correct and you're ready to build the infrastructure in Azure, apply the template in Terraform

terraform destroy : Infra managed by Terraform will be destroyed

SSH to your VM:
ssh -i <private key path> adminuser@<publicIps>

