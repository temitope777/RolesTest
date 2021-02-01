
provider "aws" {
 region  = var.region
 profile = var.profile
}

module "this" {
  source = "../../modules/external"
  role_name                  = "ThirdPartyRole"
  role_path                  = "/external/security/"
  role_description           = "Role for ThirdParty"
  role_force_detach_policies = "true"
  role_max_session_duration  = "43200"
  product_domain = "prod"
  environment    = "production"
}


