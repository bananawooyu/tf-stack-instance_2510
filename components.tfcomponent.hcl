# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "remote_state" {
  source   = "./remote_state"
  for_each = var.regions

  inputs = {
    tfc_organization  = var.tfc_organization
    network_workspace = var.network_workspace
    region            = each.value
  }

  providers = {
    terraform = provider.terraform.this
    tfe       = provider.tfe.this
  }
}

component "instance" {
  source   = "./instance"
  for_each = var.regions

  inputs = {
    network = {
      vpc_id             = component.remote_state[each.value].vpc_id
      private_subnet_ids = component.remote_state[each.value].private_subnet_ids
      security_group_ids = component.remote_state[each.value].security_group_ids
    }

    key_name = component.remote_state[each.value].key_name
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}
