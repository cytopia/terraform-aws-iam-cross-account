# ------------------------------------------------------------------------------------------------
# (Required) Assumer Account definition (from what AWS account you STS assume into this account/role)
# ------------------------------------------------------------------------------------------------

variable "assumer_account_id" {
  description = "The AWS account id/number of the assuming account that wants to assume into below defined role of the target account."
}

variable "assumer_account_role_name" {
  description = "The IAM role in the assuming account that is allowed to assume into the below defined role of the target account."
}

variable "assumer_account_role_path" {
  description = "The IAM role path in the assuming account of the role that is allowed to assume into the below defined role of the target account."
  default     = "/"
}

# ------------------------------------------------------------------------------------------------
# Role definition
# ------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the role."
}

variable "path" {
  description = "The path under which to create the role. You can use a single path, or nest multiple paths as if they were a folder structure. For example, you could use the nested path /division_abc/subdivision_xyz/product_1234/engineering/ to match your company's organizational structure."
  default     = "/"
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
  default     = "3600"
}

variable "force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  default     = true
}

variable "description" {
  description = "The description of the role."
  default     = "Managed by Terraform"
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = "map"
  default     = {}
}

# ------------------------------------------------------------------------------------------------
# Policy definition
# ------------------------------------------------------------------------------------------------

variable "policies" {
  type = "list"

  # Example:
  # policies = [{
  #   name = "test",            # required, name of the policy
  #   path = "/",               # optional, if not set 'default_policy_path' is used
  #   desc = "Description1",    # optional, if not set 'default_policy_desc' is used
  #   file = "data/policy.json" # required, path to json file defining the policy
  # },{
  #   name = "test2",
  #   path = "/",
  #   desc = "Description2",
  #   file = "data/policy2.json"
  # }]
}

variable "default_policy_path" {
  description = "The default path under which to create the policy if not specified in the policies list. You can use a single path, or nest multiple paths as if they were a folder structure. For example, you could use the nested path /division_abc/subdivision_xyz/product_1234/engineering/ to match your company's organizational structure."
  default     = "/"
}

variable "default_policy_desc" {
  description = "The description of the policy."
  default     = "Managed by Terraform"
}

variable "exclusive_policy_attachment" {
  description = "If true, the aws_iam_policy_attachment resource creates exclusive attachments of IAM policies. Across the entire AWS account, all of the users/roles/groups to which a single policy is attached must be declared by a single aws_iam_policy_attachment resource. This means that even any users/roles/groups that have the attached policy via any other mechanism (including other Terraform resources) will have that attached policy revoked by this resource."
  default     = true
}
