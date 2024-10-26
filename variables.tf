

# these are sandbox credentials so don't bother ;)
variable "subscription_id" {
  default = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
  type    = string
}

variable "resource_group_name" {
  default = "1-028b5131-playground-sandbox"
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

