provider "aws" {
 region  = var.region
 profile = var.profile
}

resource "aws_iam_user" "example" {
  for_each = var.userNames
  name     = each.key
  tags = {
      team = each.value
    }
}


resource "aws_iam_group_membership" "devteam" {
  name = "dev-membership"
  users = [

        for user in aws_iam_user.example:
        user.name
        if user.tags["team"] == "development"

  ]

 group = "dev-group"
}
resource "aws_iam_group_membership" "testteam" {
  name = "tester-membership"

  users = [

           for user in aws_iam_user.example:
           user.name
           if user.tags["team"] == "qa"
  ]

  group = "qa-group"
}
