variable "region_name" {
  description = "The AWS region to deploy into (e.g. eu-central-1)."
}

variable "organization_name" {
  description = "The name of the organization that owns all AWS resources."
}

variable "department_name" {
  description = "The name of the department that owns all AWS resources."
}

variable "project_name" {
  description = "The name of the project that owns all AWS resources."
}

variable "stage" {
  description = "The name of the current environment stage."
}

variable "vpc_id" {
  description = "Unique identifier of the VPC to host the EC2 instance(s)."
}

variable "subnet_id" {
  description = "Unique identifier of the subnet to host the EC2 instance(s)."
}

variable "ami_id" {
  description = "Unique identifier of the AMI all EC2 instances are supposed to be based on."
  default = ""
}

variable "instance_name" {
  description = "Name of the EC2 instance; will be used as a suffix to the fully qualified instance name"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "instance_key_name" {
  description = "Name of SSH key pair name to used for the EC2 instances"
}

variable "security_group_ids" {
  description = "Unique identifiers of security groups to be attached to the EC2 instances"
  type = list(string)
  default = []
}

variable "root_volume_size" {
  description = "Size of the root volume of all EC2 instances"
}

variable "data_volume_size" {
  description = "Size of the data volume (i.e. secondary volume) of all EC2 instances"
}



