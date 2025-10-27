# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  description = "AWS regions to deploy to."
  type        = set(string)
}

# variable "identity_token" {
#   description = "Identity token for authentication."
#   type        = string
#   ephemeral   = true
# }

# variable "role_arn" {
#   description = "ARN of role associated with identity token."
#   type        = string
# }

variable "access_key" {
  description = "AWS Access Key ID for authentication."
  type        = string
  ephemeral   = true
}

variable "secret_key" {
  description = "AWS Secret Access Key for authentication."
  type        = string
  ephemeral   = true
  sensitive   = true
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "tf-stack-instance_2510",
    Environment = "dev"
  }
}

variable "vpc_id" {
  description = "network stack vpc id"
  type        = string
}

variable "private_subnet_ids" {
  description = "network stack private subnet ids"
  type        = list(string)
}

variable "security_group_ids" {
  description = "network stack security group ids"
  type        = list(string)
}

variable "key_name" {
  description = "network stack key name"
  type        = string
}