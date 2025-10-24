# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  description = "AWS regions to deploy to."
  type        = set(string)
}

variable "identity_token" {
  description = "Identity token for authentication."
  type        = string
  ephemeral   = true
}

variable "role_arn" {
  description = "ARN of role associated with identity token."
  type        = string
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "tf-stack-instance_2510",
    Environment = "dev"
  }
}

variable "tfc_organization" {
  description = "Terraform Cloud organization name."
  type        = string
}

variable "network_workspace" {
  description = "Network stack workspace name in TFC."
  type        = string
}