variable "role_name" {
  description = "The name of the role. It will forces new resource on change."
  type        = string
   default     = "ThirdPartyRole"
}

variable "role_path" {
  type        = string
  default     = "/external/"
}

variable "role_description" {
  type        = string
}

variable "role_force_detach_policies" {
  default     = "false"
}

variable "account_id" {
  description = "AWS Account ID that is allowed to assume this role."
  type        = string
  default     = "467050451493"
}


variable "role_max_session_duration" {
  default     = "3600"
}

variable "role_permission_boundary" {
  type        = string
  default     = ""
}

variable "product_domain" {
  type        = string
}

variable "environment" {
  type        = string
  description = "Will be used in Environment tag"
  default="development"
}

variable "role_tags" {
  description = "Additional tags to be put on iam role"
  type        = map(string)
  default     = {}
}

variable "externalidarn" {
  type        = string
  description="please put the externalid created previously here in the format - arn:aws:secretsmanager:ap-southeast-1:327565439307:secret:topesecret-idi2t3"
  default = "AddReferenceToSecretCreatedHere"
}

variable "profile" {
  description = "AWS User account Profile"
  default = "default"
}

variable "region" {
  description = "prefered region"
  default = "eu-west-2"
}