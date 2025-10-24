# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vpc_id" {
  description = "VPC ID from network stack."
  value       = data.terraform_remote_state.network.outputs.vpc_ids[var.region]
}

output "private_subnet_ids" {
  description = "Private subnet IDs from network stack."
  value       = data.terraform_remote_state.network.outputs.private_subnet_ids[var.region]
}

output "security_group_ids" {
  description = "Security group IDs from network stack."
  value       = data.terraform_remote_state.network.outputs.security_group_ids[var.region]
}

output "key_name" {
  description = "Key pair name from network stack."
  value       = data.terraform_remote_state.network.outputs.key_names[var.region]
}