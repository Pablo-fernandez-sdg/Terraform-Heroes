terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.79.1"
    }
  }
}

provider "snowflake" {
    user  = var.username
    account   = var.account
    password = var.password_account
    role      = var.role
    port = 443
}