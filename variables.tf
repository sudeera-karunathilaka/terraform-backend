variable "aws_region" {
  description = "The AWS region where the application will be deployed"
  type        = string
  validation {
    condition     = length(var.aws_region) > 0
    error_message = "AWS region id cannot be empty"
  }
}

variable "aws_account_id" {
  description = "The AWS account id"
  type        = string
  validation {
    condition     = length(var.aws_account_id) > 0
    error_message = "AWS account id cannot be empty"
  }
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  validation {
    condition     = length(var.app_name) > 0
    error_message = "App name cannot be empty"
  }
}
