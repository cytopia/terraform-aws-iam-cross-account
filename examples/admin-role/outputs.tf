# -------------------------------------------------------------------------------------------------
# IAM Role Assumer Account
# -------------------------------------------------------------------------------------------------

output "assumer_account_id" {
  description = "The AWS account id/number of the assuming account that wants to assume into below defined role of the target account."
  value       = "${module.iam_cross_account_role.assumer_account_id}"
}

output "assumer_account_role_arn" {
  description = "The AWS account ARN of the assuming account that wants to assume into below defined role of the target account."
  value       = "${module.iam_cross_account_role.assumer_account_role_arn}"
}

output "assumer_account_role_name" {
  description = "The IAM role in the assuming account that is allowed to assume into the below defined role of the target account."
  value       = "${module.iam_cross_account_role.assumer_account_role_name}"
}

output "assumer_account_role_path" {
  description = "The IAM role path in the assuming account of the role that is allowed to assume into the below defined role of the target account."
  value       = "${module.iam_cross_account_role.assumer_account_role_path}"
}

# -------------------------------------------------------------------------------------------------
# IAM Role outputs
# -------------------------------------------------------------------------------------------------

output "cross_account_role_id" {
  description = "The stable and unique string identifying the role."
  value       = "${module.iam_cross_account_role.cross_account_role_id}"
}

output "cross_account_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.iam_cross_account_role.cross_account_role_arn}"
}

output "cross_account_role_name" {
  description = "The name of the role."
  value       = "${module.iam_cross_account_role.cross_account_role_name}"
}

output "cross_account_role_path" {
  description = "The path to the role."
  value       = "${module.iam_cross_account_role.cross_account_role_path}"
}

output "cross_account_role_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
  value       = "${module.iam_cross_account_role.cross_account_role_session_duration}"
}

output "cross_account_role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  value       = "${module.iam_cross_account_role.cross_account_role_force_detach_policies}"
}

output "cross_account_role_assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role."
  value       = "${module.iam_cross_account_role.cross_account_role_assume_role_policy}"
}

# -------------------------------------------------------------------------------------------------
# IAM Policy outputs
# -------------------------------------------------------------------------------------------------

output "cross_account_policy_arns" {
  description = "A list of ARN assigned by AWS to the policies."
  value       = "${module.iam_cross_account_role.cross_account_policy_arns}"
}

output "cross_account_policy_ids" {
  description = "A list of unique IDs of the policies."
  value       = "${module.iam_cross_account_role.cross_account_policy_ids}"
}

output "cross_account_policy_names" {
  description = "A list of names of the policies."
  value       = "${module.iam_cross_account_role.cross_account_policy_names}"
}

output "cross_account_policy_paths" {
  description = "A list of paths of the policies."
  value       = "${module.iam_cross_account_role.cross_account_policy_paths}"
}

output "cross_account_policy_policies" {
  description = "A list of the policy definitions."
  value       = "${module.iam_cross_account_role.cross_account_policy_policies}"
}

# -------------------------------------------------------------------------------------------------
# IAM Policy attachments (exclusive)
# -------------------------------------------------------------------------------------------------

output "cross_account_exclusive_policy_attachment_ids" {
  description = "A list of unique IDs of exclusive policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_exclusive_policy_attachment_ids}"
}

output "cross_account_exclusive_policy_attachment_names" {
  description = "A list of names of exclusive policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_exclusive_policy_attachment_names}"
}

output "cross_account_exclusive_policy_attachment_policy_arns" {
  description = "A list of ARNs of exclusive policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_exclusive_policy_attachment_policy_arns}"
}

output "cross_account_exclusive_policy_attachment_role_names" {
  description = "A list of role names of exclusive policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_exclusive_policy_attachment_role_names}"
}

# -------------------------------------------------------------------------------------------------
# IAM Policy attachments (imperative)
# -------------------------------------------------------------------------------------------------

output "cross_account_imperative_policy_attachment_ids" {
  description = "A list of unique IDs of shared policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_imperative_policy_attachment_ids}"
}

output "cross_account_imperative_policy_attachment_names" {
  description = "A list of names of shared policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_imperative_policy_attachment_names}"
}

output "cross_account_imperative_policy_attachment_policy_arns" {
  description = "A list of ARNs of shared policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_imperative_policy_attachment_policy_arns}"
}

output "cross_account_imperative_policy_attachment_role_names" {
  description = "A list of role names of shared policy attachments."
  value       = "${module.iam_cross_account_role.cross_account_imperative_policy_attachment_role_names}"
}
