variable "userlist" {
  type    = list(string)
  default = ["emmanuel", "dennis"]
}

variable "profile" {
  description = "AWS User account Profile"
  default = "default"
}

variable "region" {
  description = "prefered region"
  default = "eu-west-2"
}