# ----------------------------------------------------------------------------
# main.tf
# ----------------------------------------------------------------------------
# Main entrypoint of this Terraform module.
# ----------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Local values used in this module
locals {
  module_common_tags = var.common_tags
}

data aws_region current {

}

data aws_vpc given {
  id = var.vpc_id
}

data aws_availability_zones zones {
  state = "available"
}
