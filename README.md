# Ansible-Provision
Demos for Ansible provisioning and deprovisioning using Terraform, just RHV, or Satellite

# Templates

terraform.tf.j2
>terraform main.tf for use with terraform create.yml Allows you to specify name of VM at runtime

# Playbooks
removesubs.yml
>Remove RH sub subscriptions and delete host from Satellite

rhv_snapshot_create.yml
>Create a snapshot of a VM on RHV

rhv_vm_create.yml
>Create a VM on RHV. All ovirt_auth information stored as a credential in Ansible Tower, {{ vm_name }} and {{ vm_state }} must be supplied by user

rhv_vm_remove.yml
>Remove a VM on RHV. All ovirt_auth information stored as a credential in Ansible Tower, {{ vm_name }} must be supplied by user

rhv_vm_tag.yml
>Create tags on hosts based on os installed

sat_vm_create.yml
>Create a VM on Sat. All credentials stored in Ansible Tower

sat_vm_remove.yml
>Remove a VM on Sat. All credentials stored in Ansible Tower

terraform create.yml
>Create or remove a VM on RHV using Terraform. {{ vm_name }} must be supplied by the user. This will update the main.yml file to have a name supplied at time of fun. Terraform scripts are located on Tower server at ~/terraform. Defaults are in ~/terraform/modules/vms with the runtime and authentication scripts at ~/terraform/ovirt

terraform_create_tag.yml
>Create tags on hosts in RHV based on os installed

wait.yml
>retests if the VM agent has been installed for RHEL or Windows