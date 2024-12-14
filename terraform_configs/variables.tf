

# these are sandbox credentials so dear hackers, don't bother ;)
variable "subscription_id" {
  default = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  type    = string
}

variable "resource_group_name" {
  default = "1-fc2e0ee7-playground-sandbox"
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

