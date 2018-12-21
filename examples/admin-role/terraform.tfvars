# The current account
name = "patrick-admin2"
path = "/engineering/devops/"
description = "Managed by Terraform2"

policies = [{
  name = "test",
  path = "/",
  desc = "Description1",
  file = "data/policy.json"
},{
  name = "test2",
  path = "/",
  desc = "Description2",
  file = "data/policy2.json"
}]

# The account from which to assume the current account
assumer_account_id = "445804254772"
assumer_account_role_name = "AWS-Common-Secure-STS-Admins"


tags = {
  Name = "patrick"
}

max_session_duration = "28800"
