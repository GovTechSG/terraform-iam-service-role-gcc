variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "description" {
  description = "description of the role"
  type        = string
}

variable "max_session_duration" {
  description = "maximum duration in seconds for role, between 1 to 12 hours"
  type        = number
  default     = 3600
}

variable "name" {
  description = "name of the role in aws console"
  type        = string
}

variable "path" {
  description = "path of the role in aws console"
  type        = string
  default     = "/"
}

variable "base_policy" {
  description = "Base policy of trust relationship for assuming this role"
  type        = string
}

variable "custom_policy" {
  description = "custom policy to be applied to role using the EOF syntax"
  type        = string
  default     = ""
}

variable "attach_policies" {
  description = "map(string) of existing policies to attach"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Terraform = "True"
  }
}

variable "enable_gcci_boundary" {
  description = "toggle for gcci boundary to allow non-gcc accounts to create role"
  type        = bool
  default     = true
}

variable "create_instance_profile" {
  description = "Create an instance profile using this role"
  type        = bool
  default     = false
}
