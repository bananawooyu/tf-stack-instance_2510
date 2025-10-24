# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "instance_ids" {
  type        = map(list(string))
  description = "EC2 instance IDs by region"
  value       = { for region, instance in component.instance : region => instance.instance_ids }
}

output "instance_private_dns" {
  type        = map(list(string))
  description = "EC2 instance Private DNS names by region"
  value       = { for region, instance in component.instance : region => instance.private_dns }
}