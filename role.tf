### USERS

resource "snowflake_user" "MIKE" {
  name = "MIKE"
  login_name = "MIKE"
  password = var.password_generic
  email = "mike@heroes.com"
  comment = "Mike is a Platform Administrator"

  must_change_password = true
}

resource "snowflake_user" "JOHNNY" {
  name = "JOHNNY"
  login_name = "JOHNNY"
  password = var.password_generic
  email = "johnny@heroes.com"
  comment = "Johnny is a Data Analyst"

  must_change_password = true
}

resource "snowflake_user" "SARAH" {
  name = "SARAH"
  login_name = "SARAH"
  password = var.password_generic
  email = "sarah@heroes.com"
  comment = "Johnny is a Developer"

  must_change_password = true
}

## CARLOS USER

resource "snowflake_user" "CARLOS" {
  name = "CARLOS"
  login_name = "CARLOS"
  password = var.password_generic
  must_change_password = true
}

### ROLE

resource "snowflake_role" "Platform_Admin" {
  name    = "Platform_Admin"
  comment = "This role is for the user that have all control"
}

resource "snowflake_role" "Analyst" {
  name    = "Analyst"
  comment = "This role is especific for the user data work in data analyst"
}

resource "snowflake_role" "Developer" {
  name    = "Developer"
  comment = "This role is for the user that are developers"
}

### PRIVILEGIES

# Analyst privileges

# Privilegio para crear tablas en la BD de producción
resource "snowflake_grant_privileges_to_role" "Analyst_create_privileges" {
  role_name = snowflake_role.Analyst.name
  privileges = ["CREATE TABLE"]
  on_schema {
    all_schemas_in_database = snowflake_database.BD_HR_PRO.name
  }
}

# Privilegio para insertar en la BD de producción
resource "snowflake_grant_privileges_to_role" "Analyst_insert_privileges" {
  role_name = snowflake_role.Analyst.name
  privileges = ["INSERT"]
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.BD_HR_PRO.name
    }
  }
}

# Developers privileges

# Privilegios para crear, modificar objetos en la BD de desarrollo
resource "snowflake_grant_privileges_to_role" "developer_create_privileges_dev" {
  role_name   = snowflake_role.Developer.name
  privileges  = ["CREATE TABLE","CREATE VIEW", "MODIFY"]
  on_schema {
    all_schemas_in_database = snowflake_database.BD_HR_DEV.name
  }
}

# Privilegios para eliminar objetos en las tablas de BD de desarrollo
resource "snowflake_grant_privileges_to_role" "developer_delete_privileges_dev" {
  role_name = snowflake_role.Analyst.name
  privileges = ["DELETE"]
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.BD_HR_DEV.name
    }
  }
}


# Privilegio para actualizar datos en las tablas de producción
resource "snowflake_grant_privileges_to_role" "developer_privileges_pro" {
  role_name   = snowflake_role.Developer.name
  privileges  = ["UPDATE"]
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.BD_HR_PRO.name
    }
  }
}


## Associate role

resource "snowflake_role_grants" "grants_Platform_Admin" {
    role_name = snowflake_role.Platform_Admin.name
    roles = ["ACCOUNTADMIN"]
    users = [snowflake_user.MIKE.name]
}

resource "snowflake_role_grants" "grants_Analyst" {
    role_name = snowflake_role.Analyst.name
    users = [snowflake_user.JOHNNY.name]
}

resource "snowflake_role_grants" "grants_Developers" {
    role_name = snowflake_role.Developer.name
    users = [snowflake_user.SARAH.name]
}

resource "snowflake_role_grants" "grants_Carlos_Admin" {
    role_name = snowflake_role.Platform_Admin.name
    roles = ["ACCOUNTADMIN"]
    users = [snowflake_user.CARLOS.name]
}
