# ----------------------------------------------------------------------------
# main.tf
# ----------------------------------------------------------------------------
# Main entrypoint of this Terraform module.
# ----------------------------------------------------------------------------

provider "aws" {
  region  = var.region_name
  version = "~> 3.0"
}

# Local values used in this module
locals {
  main_common_tags = {
    Organization = var.organization_name
    Department   = var.department_name
    Project      = var.project_name
    Stage        = var.stage
  }
}

# to keep things simple retrieve the latest AMI version used for all EC2 instances
data "aws_ami" "amazon_linux2" {
  owners = ["137112412989"]
  #  executable_users = ["self"]
  most_recent = "true"
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "single" {
  source = "../.."
  region_name = var.region_name
  organization_name = var.organization_name
  department_name = var.department_name
  project_name = var.project_name
  stage = var.stage
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  ami_id = data.aws_ami.amazon_linux2.id
  instance_name= var.instance_name
  instance_type = var.instance_type
  instance_key_name = var.instance_key_name
  root_volume_size = var.root_volume_size
  data_volume_size = 100
}


