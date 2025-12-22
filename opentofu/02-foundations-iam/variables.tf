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

variable "hub_account_id" {
  type        = string
  description = "(required) Hub account ID"
}

variable "platform_account_id" {
  type        = string
  description = "(required) platform account ID"
}

variable "observability_account_id" {
  type        = string
  description = "(required) observability account ID"
}

variable "dev_account_id" {
  type        = string
  description = "(required) dev account ID"
}

variable "prod_account_id" {
  type        = string
  description = "(required) Prod account ID"
}
