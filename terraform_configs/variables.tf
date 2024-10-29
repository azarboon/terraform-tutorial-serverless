

# these are sandbox credentials so don't bother ;)
variable "subscription_id" {
  default = "80ea84e8-afce-4851-928a-9e2219724c69"
  type    = string
}

variable "resource_group_name" {
  default = "1-d4b1fcf6-playground-sandbox"
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

