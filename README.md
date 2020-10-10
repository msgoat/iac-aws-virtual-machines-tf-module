# iac-aws-virtual-machines-tf: Terraform module to set up EC2 instances with various options

Creates an EC2 instance or an elastic pool of EC2 instances.
 
## Input Variables

Variable Name | Variable Type | Mandatory? | Description | Default  
 --- | --- | --- | --- | --- 
region_name | string | x | The AWS region to deploy into (e.g. eu-central-1) |
organization_name | string | x | The name of the organization that owns all AWS resources |  
department_name | string | x | The name of the department that owns all AWS resources | 
project_name | string | x | The name of the project that owns all AWS resources |
stage | string | x | The name of the current environment stage |
vpc_id | string | x | Unique identifier of the VPC to host the EC2 instance(s) |
subnet_id | string | x | Unique identifier of the subnet to host the EC2 instance(s) |
ami_id | string | x | Unique identifier of the AMI all EC2 instances are supposed to be based on |
instance_name | string | x | Name of the EC2 instance; will be used as a suffix to the fully qualified instance name |
instance_type | string | x | EC2 instance type |
instance_key_name | string | x | Name of SSH key pair name to used for the EC2 instances |
security_group_ids | string | x | Unique identifiers of security groups to be attached to the EC2 instances |
root_volume_size | string | x | Size of the root volume of all EC2 instances |
data_volume_size Size | string | x | of the data volume (i.e. secondary volume) of all EC2 instances |

## Outputs

Output Name | Output Type | Description  
 --- | --- | ---  
instance_id | string | Unique identifier of the EC2 instance created by this module
