variable "app_name" {
  description = "The nape of the application"
  type        = string
}
variable "location" {
  description = "The location "
  type        = string
}
variable "address_space" {
  description = "address_space"
  type        = list(string)
}
variable "public_subnet" {
  description = "Address space for public subnet"
  type        = list(string)
}
variable "use_for_each" {
  description = "value"
  type        = bool
}
variable "admin_password" {
  description = "The password to log into azure spot instance"
  type        = string
}