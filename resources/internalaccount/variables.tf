
variable "userNames" {
  type = map(string)
 description = "user details and department (team) of the users to be created - this should be passed in from command line "
  default = {
    emmanuel = "developer"
    john = "tester"
  }
}

variable "profile" {
  description = "AWS User account Profile"
  default = "default"
}

variable "region" {
  description = "prefered region"
  default = "eu-west-2"
}