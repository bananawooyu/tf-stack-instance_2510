# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "instance" {
  source = "./instance"

  inputs = {
    network = {
      vpc_id             = var.vpc_id
      private_subnet_ids = var.private_subnet_ids
      security_group_ids = var.security_group_ids
    }

    key_name = var.key_name
  }

  providers = {
    aws = provider.aws.this
  }
}