variable "aws_region" {
  type        = string
  description = "(optional) aws target region"
  default     = "eu-west-3"
}

variable "project_code" {
  type        = string
  description = "(optional) project code name"
  default     = "pltfrm"
}

variable "project_name" {
  type        = string
  description = "(optional) project full name"
  default     = "aws-platform-starter-kit"
}

variable "root_ou_id" {
  type        = string
  description = "(required) ID of the Root Organization Unit"
  default     = "r-h315"
}
