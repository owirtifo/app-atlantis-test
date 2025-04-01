variable "YC_DEFAULT_REGION" {
  description = "YC Region"
  type        = string
}

variable "bk_access_key" {
  description = "Backend access key"
  type        = string
  sensitive   = true
}

variable "bk_secret_key" {
  description = "Backend secret key"
  type        = string
  sensitive   = true
}
