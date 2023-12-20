## DATA BASES

output "BD_resource_DEV" {
  value = snowflake_database.BD_HR_DEV.name
}

output "BD_resource_PRO" {
  value = snowflake_database.BD_HR_PRO.name
}
