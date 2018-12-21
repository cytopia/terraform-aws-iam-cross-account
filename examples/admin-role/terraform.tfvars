name = "the-role-name"
path = "/engineering/devops/"

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
}]

tags = {
  Name  = "prod-admin-role"
  Env   = "prod"
  Owner = "terraform"
}

max_session_duration = "36000"
