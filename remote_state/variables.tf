# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "tfc_organization" {
  description = "Terraform Cloud organization name."
  type        = string
}

variable "network_workspace" {
  description = "Network stack workspace name in TFC."
  type        = string
}

variable "region" {
  description = "AWS region."
  type        = string
}