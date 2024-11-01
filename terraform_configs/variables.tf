

# these are sandbox credentials so don't bother ;)
variable "subscription_id" {
  default = "9734ed68-621d-47ed-babd-269110dbacb1"
  type    = string
}

variable "resource_group_name" {
  default = "1-7f4395a9-playground-sandbox"
  type    = string
}


variable "sku" {
  description = "The pricing tier of this API Management service"
  default     = "Developer"
  type        = string
  validation {
    condition     = contains(["Developer", "Standard", "Premium"], var.sku)
    error_message = "The sku must be one of the following: Developer, Standard, Premium."
  }
}

