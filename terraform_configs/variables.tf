

# these are sandbox credentials so don't bother ;)
variable "subscription_id" {
  default = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
  type    = string
}

variable "resource_group_name" {
  default = "1-752deac8-playground-sandbox"
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

