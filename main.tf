# ------------------------------------------------------------------------------------------------
# Create cross-account assumable Role
# ------------------------------------------------------------------------------------------------

# Create Cross-account Trusted Relationship for Role
data "aws_iam_policy_document" "cross_account_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.assumer_account_id}:role${var.assumer_account_role_path}${var.assumer_account_role_name}"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Create Role
resource "aws_iam_role" "cross_account_role" {
  name = "${var.name}"
  path = "${var.path}"

  assume_role_policy = "${data.aws_iam_policy_document.cross_account_role_policy.json}"

  # Allow session for X seconds
  max_session_duration = "${var.max_session_duration}"

  force_detach_policies = "${var.force_detach_policies}"

  description = "${var.description}"

  tags = "${var.tags}"
}

# ------------------------------------------------------------------------------------------------
# Create Policies for the above Role
# ------------------------------------------------------------------------------------------------

resource "aws_iam_policy" "policies" {
  count = "${length(var.policies)}"

  name        = "${lookup(var.policies[count.index], "name")}"
  path        = "${lookup(var.policies[count.index], "path", var.default_policy_path)}"
  description = "${lookup(var.policies[count.index], "desc", var.default_policy_desc)}"

  policy = "${file(lookup(var.policies[count.index], "file"))}"
}

# ------------------------------------------------------------------------------------------------
# Attach Policies to Role
# ------------------------------------------------------------------------------------------------
# IMPORTANT: https://www.terraform.io/docs/providers/aws/r/iam_policy_attachment.html

# Exclusive attachment of roles
resource "aws_iam_policy_attachment" "exclusive_policy_attachment" {
  count = "${var.exclusive_policy_attachment ? length(var.policies) : 0}"

  name       = "${lookup(var.policies[count.index], "name")}-policy"
  roles      = ["${aws_iam_role.cross_account_role.name}"]
  policy_arn = "${element(aws_iam_policy.policies.*.arn, count.index)}"
}

# Additive adding of roles
resource "aws_iam_role_policy_attachment" "imperative_policy_attachment" {
  count = "${var.exclusive_policy_attachment ? 0 : length(var.policies)}"

  role       = "${aws_iam_role.cross_account_role.name}"
  policy_arn = "${element(aws_iam_policy.policies.*.arn, count.index)}"
}
