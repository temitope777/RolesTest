variable "region" {
  description = "The region from which this module will be executed"
  type        = string
  default     = "eu-west-2"
}

variable "role_name" {
  description = "The name of the role. It will forces new resource on change."
  type        = string
}

variable "role_path" {
  description = "The path to the role."
  type        = string
  default     = "/"
}

variable "role_description" {
  description = "The description of the role."
  type        = string
}

variable "product_domain" {
  type        = string
}

variable "environment" {
  type        = string
  description = "the environment role for tags"
}

variable "role_tags" {
  type        = map(string)
  default     = {}
}

variable "role_assume_policy" {
  description = "IAM policy document that grants an entity permission to assume the role in JSON format."
  type        = string
}

variable "role_force_detach_policies" {
  default     = false
}

variable "role_max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. "
  default     = 3600
}

variable "role_permission_boundary" {
  description = "IAM policy ARN limiting the maximum access this role can have"
  type        = string
  default     = ""
}

