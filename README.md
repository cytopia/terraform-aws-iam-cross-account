# Terraform module: AWS IAM cross-account

This Terraform module create roles and policy in your target account which can be assumed from a
source account specified by account id, role name and role path.

Multiple policies can be attached to the role in your target account and their definitions must be
specified from files. See usage or examples for more detail.

**Note:** Policy attachments can be done decleratively (exclusive) or imperatively (shared).

[![Build Status](https://travis-ci.org/cytopia/terraform-aws-iam-cross-account.svg?branch=master)](https://travis-ci.org/cytopia/terraform-aws-iam-cross-account)
[![Tag](https://img.shields.io/github/tag/cytopia/terraform-aws-iam-cross-account.svg)](https://github.com/cytopia/terraform-aws-iam-cross-account/releases)
[![Terraform](https://img.shields.io/badge/Terraform--registry-aws--iam--cross--account-brightgreen.svg)](https://registry.terraform.io/modules/cytopia/iam-cross-account/aws/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)


## Quick setup

```hcl
module "iam_cross_account_role" {
  source = "github.com/cytopia/terraform-aws-iam-cross-account?ref=v0.1.0"

  name = "the-role-name"

  policies = [{
    name = "policy-name",
    file = "data/policy.json"
  }]

  # The account from which to assume the current account
  assumer_account_id        = "1234567890"
  assumer_account_role_name = "AWS-Admins"
}
```


## Usage

```hcl
module "iam_cross_account_role" {
  source = "github.com/cytopia/terraform-aws-iam-cross-account?ref=v0.1.0"

  # The current account
  name        = "the-role-name"
  path        = "/engineering/admin/"
  description = "Managed by Terraform"

  # Maximum login session for that role
  max_session_duration = "36000"

  # Policies to create and attach
  policies = [{
    name = "policy-1-name",
    path = "/",
    desc = "Description 1",
    file = "data/policy1.json"
  },{
    name = "policy-2-name",
    path = "/",
    desc = "Description 2",
    file = "data/policy2.json"
  ]}

  # Handle policies exclusively (declarative vs imperative)
  exclusive_policy_attachment = "true

  # The account from which to assume the current account
  assumer_account_id        = "1234567890"
  assumer_account_role_name = "AWS-Admins"
  assumer_account_role_path = "/"

  tags = {
    Name  = "prod-admin-role"
    Env   = "prod"
    Owner = "terraform"
  }
}
```
**`data/policy1.json`**
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
```
**`data/policy2.json`**
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
```


## Examples

* [admin-role](examples/admin-role)


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| assumer\_account\_id | The AWS account id/number of the assuming account that wants to assume into below defined role of the target account. | string | n/a | yes |
| assumer\_account\_role\_name | The IAM role in the assuming account that is allowed to assume into the below defined role of the target account. | string | n/a | yes |
| assumer\_account\_role\_path | The IAM role path in the assuming account of the role that is allowed to assume into the below defined role of the target account. | string | `"/"` | no |
| name | The name of the role. | string | n/a | yes |
| path | The path under which to create the role. You can use a single path, or nest multiple paths as if they were a folder structure. For example, you could use the nested path /division_abc/subdivision_xyz/product_1234/engineering/ to match your company's organizational structure. | string | `"/"` | no |
| max\_session\_duration | The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours. | string | `"3600"` | no |
| force\_detach\_policies | Specifies to force detaching any policies the role has before destroying it. | string | `"true"` | no |
| description | The description of the role. | string | `"Managed by Terraform"` | no |
| tags | Key-value mapping of tags for the IAM role. | map | `<map>` | no |
| policies |  | list | n/a | yes |
| default\_policy\_path | The default path under which to create the policy if not specified in the policies list. You can use a single path, or nest multiple paths as if they were a folder structure. For example, you could use the nested path /division_abc/subdivision_xyz/product_1234/engineering/ to match your company's organizational structure. | string | `"/"` | no |
| default\_policy\_desc | The description of the policy. | string | `"Managed by Terraform"` | no |
| exclusive\_policy\_attachment | If true, the aws_iam_policy_attachment resource creates exclusive attachments of IAM policies. Across the entire AWS account, all of the users/roles/groups to which a single policy is attached must be declared by a single aws_iam_policy_attachment resource. This means that even any users/roles/groups that have the attached policy via any other mechanism (including other Terraform resources) will have that attached policy revoked by this resource. | string | `"true"` | no |


## Outputs

| Name | Description |
|------|-------------|
| assumer\_account\_id | The AWS account id/number of the assuming account that wants to assume into below defined role of the target account. |
| assumer\_account\_role\_arn | The AWS account ARN of the assuming account that wants to assume into below defined role of the target account. |
| assumer\_account\_role\_name | The IAM role in the assuming account that is allowed to assume into the below defined role of the target account. |
| assumer\_account\_role\_path | The IAM role path in the assuming account of the role that is allowed to assume into the below defined role of the target account. |
| cross\_account\_role\_id | The stable and unique string identifying the role. |
| cross\_account\_role\_arn | The Amazon Resource Name (ARN) specifying the role. |
| cross\_account\_role\_name | The name of the role. |
| cross\_account\_role\_path | The path to the role. |
| cross\_account\_role\_session\_duration | The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours. |
| cross\_account\_role\_force\_detach\_policies | Specifies to force detaching any policies the role has before destroying it. |
| cross\_account\_role\_assume\_role\_policy | The policy that grants an entity permission to assume the role. |
| cross\_account\_policy\_arns | A list of ARN assigned by AWS to the policies. |
| cross\_account\_policy\_ids | A list of unique IDs of the policies. |
| cross\_account\_policy\_names | A list of names of the policies. |
| cross\_account\_policy\_paths | A list of paths of the policies. |
| cross\_account\_policy\_policies | A list of the policy definitions. |
| cross\_account\_exclusive\_policy\_attachment\_ids | A list of unique IDs of exclusive policy attachments. |
| cross\_account\_exclusive\_policy\_attachment\_names | A list of names of exclusive policy attachments. |
| cross\_account\_exclusive\_policy\_attachment\_policy\_arns | A list of ARNs of exclusive policy attachments. |
| cross\_account\_exclusive\_policy\_attachment\_role\_names | A list of role names of exclusive policy attachments. |
| cross\_account\_imperative\_policy\_attachment\_ids | A list of unique IDs of shared policy attachments. |
| cross\_account\_imperative\_policy\_attachment\_names | A list of names of shared policy attachments. |
| cross\_account\_imperative\_policy\_attachment\_policy\_arns | A list of ARNs of shared policy attachments. |
| cross\_account\_imperative\_policy\_attachment\_role\_names | A list of role names of shared policy attachments. |


## Example output

This is an example output matching the example given above.

* `5555444400`: The current AWS account ID against which this module is run
* `1234567890`: The AWS account ID from which you want to be able to assume into the current account.

```bash
Outputs:

assumer_account_id = 1234567890
assumer_account_role_arn = arn:aws:iam::1234567890:role/AWS-Admins
assumer_account_role_name = AWS-Admins
assumer_account_role_path = /
cross_account_exclusive_policy_attachment_ids = [
    policy-1-name,
    policy-2-name 
]
cross_account_exclusive_policy_attachment_names = [
    policy-1-name,
    policy-2-name 
]
cross_account_exclusive_policy_attachment_policy_arns = [
    arn:aws:iam::5555444400:policy/policy-1-name,
    arn:aws:iam::5555444400:policy/policy-2-name
]
cross_account_exclusive_policy_attachment_roles = [
    [
        policy-1-name
    ],
    [
        policy-2-name
    ]
]
cross_account_imperative_policy_attachment_ids = []
cross_account_imperative_policy_attachment_names = []
cross_account_imperative_policy_attachment_policy_arns = []
cross_account_imperative_policy_attachment_roles = []
cross_account_policy_arns = [
    arn:aws:iam::5555444400:policy/policy-1-name,
    arn:aws:iam::5555444400:policy/policy-2-name
]
cross_account_policy_ids = [
    arn:aws:iam::5555444400:policy/policy-1-name,
    arn:aws:iam::5555444400:policy/policy-2-name
]
cross_account_policy_names = [
    policy-1-name,
    policy-2-name
]
cross_account_policy_paths = [
    /,
    /
]
cross_account_policy_policies = [
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }, {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
]

cross_account_role_arn = arn:aws:iam::5555444400:role/engineering/admin/the-role-name
cross_account_role_assume_role_policy = {"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"AWS":"arn:aws:iam::1234567890:role/AWS-Admins"},"Action":"sts:AssumeRole"}]}
cross_account_role_force_detach_policies = true
cross_account_role_id = XYZXYZXYZYXZYXZYXZ
cross_account_role_name = the-role-name
cross_account_role_path = /engineering/admin/
cross_account_role_session_duration = 28800
```


## Authors

Module managed by [cytopia](https://github.com/cytopia).


## License

[MIT License](LICENSE)

Copyright (c) 2018 [cytopia](https://github.com/cytopia)
