variable "username" {
  description = "El nombre de usuario para acceder a Snowflake"
  type        = string
}

variable "account" {
  description = "El nombre de la cuenta de Snowflake"
  type        = string
}

variable "role" {
  description = "El rol a utilizar en Snowflake"
  type        = string
}

variable "password_account" {
  description = "La contraseña que va a utilizar para entrar Snowflake y usar la accountadmin"
  type        = string
  sensitive = true
}

variable "password_generic" {
  description = "Esta es una contraseña generica para el resto de usuarios"
  type        = string
  sensitive = true
}