## Warehouse DEV

resource "snowflake_warehouse" "WH_DEV" {
  name           = "WH_DEV"
  comment        = "This warehouse is create for all queries of DEV environment"
  warehouse_size = "X-SMALL"
  auto_resume = true
  auto_suspend = 300
  min_cluster_count = 1
  max_cluster_count = 6
}

## Warehouse PRO

resource "snowflake_warehouse" "WH_PRO" {
  name           = "WH_PRO"
  comment        = "This warehouse is create for all queries of PRO environment"
  warehouse_size = "SMALL" # Debido a que numero maximo de clusters es 10
  auto_resume = true
  auto_suspend = 300
  min_cluster_count = 3
  max_cluster_count = 7
}

## Monitor DEV

resource "snowflake_resource_monitor" "Monitor_DEV" {
    name           = "Monitor_DEV"
    credit_quota   = 6  

    frequency      = "DAILY" 
    start_timestamp = "Immediately" 

  # Configuración de alertas
    notify_triggers = [ 60,75 ]
    suspend_trigger = 85
    suspend_immediate_trigger = 95

    notify_users = [var.username]
    warehouses = [ snowflake_warehouse.WH_DEV.name ]
}

## Monitor PRO

resource "snowflake_resource_monitor" "Monitor_PRO" {
    name           = "Monitor_PRO"
    credit_quota   = 14  

    frequency      = "DAILY" 
    start_timestamp = "Immediately"  

  # Configuración de alertas
    notify_triggers = [ 60,75 ]
    suspend_trigger = 85
    suspend_immediate_trigger = 95

    notify_users = [var.username]
    warehouses = [ snowflake_warehouse.WH_PRO.name ]
}

## Monitor ACCOUNT

resource "snowflake_resource_monitor" "Monitor_ACCOUNT" {
    name           = "Monitor_ACCOUNT"
    credit_quota   = 20  

    frequency      = "DAILY" 
    start_timestamp = "Immediately"  

  # Configuración de alertas
    notify_triggers = [ 60,75 ]
    suspend_trigger = 85
    suspend_immediate_trigger = 95

    notify_users = [var.username]
    set_for_account = true
}