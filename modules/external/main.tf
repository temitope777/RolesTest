
provider "aws" {
 region  = var.region
 profile = var.profile
}

 data "aws_secretsmanager_secret_version" "example" {
  secret_id = var.externalidarn
} 

# Trust relationships policy document
data "aws_iam_policy_document" "doc" {
  statement {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.account_id]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values = [jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)["testkey"]]
    }
  }
}

# Module, the parent module.
module "this" {
  source = "../../"
  role_name        = var.role_name
  role_path        = var.role_path
  role_description = var.role_description
  role_tags        = var.role_tags
  role_assume_policy         = data.aws_iam_policy_document.doc.json
  role_permission_boundary   = var.role_permission_boundary
  role_force_detach_policies = var.role_force_detach_policies
  role_max_session_duration  = var.role_max_session_duration
  product_domain = var.product_domain
  environment    = var.environment
}

