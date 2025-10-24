# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# 네트워크 스택의 Remote State 참조
data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.network_workspace
    }
    # Terraform Cloud token will be automatically provided in TFC environment
  }
}