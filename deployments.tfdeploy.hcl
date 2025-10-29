# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# identity_token "aws" {
#   audience = ["aws.workload.identity"]
# }

store "varset" "aws_creds" {
  id       = "varset-YecpES2hy9E5tUSw"
  category = "env"
}

upstream_input "network_stack" {
    type     = "stack"
    source   = "app.terraform.io/rum-org-korean-air/jaehyeun/tf-stack-network_2510"
}

deployment "development" {
  inputs = {
    # role_arn              = store.varset.aws_creds.AWS_ROLE_ARN
    # identity_token        = identity_token.aws.jwt
    access_key        = store.varset.aws_creds.AWS_ACCESS_KEY_ID
    secret_key        = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
    
    # Network stack outputs (to be manually configured)
    vpc_id             = upstream_input.network_stack.networks_output.vpc_id 
    private_subnet_ids = upstream_input.network_stack.networks_output.private_subnet_ids
    security_group_id = upstream_input.network_stack.networks_output.security_group_ids
    key_name           = upstream_input.network_stack.networks_output.key_name

    default_tags = {
      Stack       = "tf-stack-instance_2510",
      Environment = "dev"
    }
  }
}

# deployment "production" {
#   inputs = {
#     regions = ["ap-northeast-1"]
#     # role_arn              = store.varset.aws_creds.AWS_ROLE_ARN
#     # identity_token        = identity_token.aws.jwt
#     access_key        = store.varset.aws_creds.AWS_ACCESS_KEY_ID
#     secret_key        = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
#     tfc_organization  = "rum-org-korean-air"
#     network_workspace = "tf-stack-network_2510-production"
#     default_tags = {
#       Stack       = "tf-stack-instance_2510",
#       Environment = "prod"
#     }
#   }
# }
