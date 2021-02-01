
provider "aws" {
 region  = var.region
 profile = var.profile
}

resource "aws_iam_policy_attachment" "dev-attach" {
  name       = "dev-attachment"
  groups     = [aws_iam_group.developer.name]
  policy_arn = aws_iam_policy.dev-policy.arn
}

resource "aws_iam_policy_attachment" "tester-attach" {
  name       = "tester-attachment"
  groups     = [aws_iam_group.tester.name]
  policy_arn = aws_iam_policy.tester-policy.arn
}

resource "aws_iam_user" "dev_user" {
  name = "dev-user"
}

resource "aws_iam_user" "test_user" {
  name = "test-user"
}

resource "aws_iam_group" "developer" {
  name = "dev-group"
}

resource "aws_iam_group" "tester" {
  name = "qa-group"
}

resource "aws_iam_group_membership" "devteam" {
  name = "dev-membership"

  users = [
    aws_iam_user.dev_user.name
  ]

  group = aws_iam_group.tester.name
}
resource "aws_iam_group_membership" "testteam" {
  name = "tester-membership"

  users = [
    aws_iam_user.test_user.name
  ]

  group = aws_iam_group.developer.name
}

resource "aws_iam_policy" "dev-policy" {
  name        = "dev-policy"
  description = "A dev policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListObjects",
        "s3:DeleteBucket",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
             "StringEquals": {
                 "s3:ResourceTag/Environment": ["Production", "Development"]
             }
         }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "tester-policy" {
  name        = "tester-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListObjects",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
             "StringEquals": {
                 "s3:ResourceTag/Environment": ["Production", "Development"]
             }
         }
    }
  ]
}
EOF
}

