# ----------------------------------------------------------------------------
# main.tf
# ----------------------------------------------------------------------------
# Main entrypoint of this Terraform module.
# ----------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
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

data "aws_region" "current" {

}

data "aws_vpc" "given" {
  id = var.vpc_id
}

data "aws_availability_zones" "zones" {
  state = "available"
}
