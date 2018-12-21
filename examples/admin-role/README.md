# Admin role example

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run terraform destroy when you don't need these resources.


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

