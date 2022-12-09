variable "region" {
  type        = string
  description = "The AWS region, where networking infrastructure will be created (e.g. 'eu-west-1')."
  default     = "eu-west-1"

  validation {
    condition = can(index([
      "eu-west-1",
      "eu-west-2",
      "eu-west-3",
    ], var.region) >= 0)

    error_message = "Value of 'region' must be a valid europe region."
  }
}


variable "mongodb" {
  type        = map(string)
  default     = {}
  description = "MongoDB Atlas provider configuration"
}



variable "mongodb_atlas_project" {
  type        = map(string)
  default     = {}
  description = "MongoDB Atlas project configuration."
}


variable "username" {
  type = string
  description = "Username for MongoDB Atlas database user."
}

variable "password" {
  type = string
  description = "Password for MongoDB Atlas database user."
}


variable "global_tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources."
}