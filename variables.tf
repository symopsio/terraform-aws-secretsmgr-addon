variable "environment" {
  description = "An environment qualifier for the resources this module creates, to support a Terraform SDLC. The environment value is also the tag value that secrets must be tagged with to be accessible by this addon."
  type        = string
}

variable "tag_name" {
  description = "Name of the tag that secrets must be tagged with to be accessible by this addon."
  default     = "SymEnv"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

