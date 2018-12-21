# -------------------------------------------------------------------------------------------------
# AWS Settings
# -------------------------------------------------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
}

# -------------------------------------------------------------------------------------------------
# Modules Settings
# -------------------------------------------------------------------------------------------------
module "iam_cross_account_role" {
  source = "../../"

  # The current account
  name        = "${var.name}"
  path        = "${var.path}"
  description = "${var.description}"

  # Maximum login session for that role
  max_session_duration = "${var.max_session_duration}"

  # Policies to create and attach
  policies = "${var.policies}"

  # Handle policies exclusively (declarative vs imperative)
  exclusive_policy_attachment = "${var.exclusive_policy_attachment}"

  # The account from which to assume the current account
  assumer_account_id        = "${var.assumer_account_id}"
  assumer_account_role_name = "${var.assumer_account_role_name}"
  assumer_account_role_path = "${var.assumer_account_role_path}"

  tags = "${var.tags}"
}
