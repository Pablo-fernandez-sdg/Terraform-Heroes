### BD DEV

resource "snowflake_database" "BD_HR_DEV" {
  name                        = "BD_HR_DEV"
  comment                     = "DB of developers"
  data_retention_time_in_days = 2
}

### BD PRO

resource "snowflake_database" "BD_HR_PRO" {
  name                        = "BD_HR_PRO"
  comment                     = "DB for production"
  data_retention_time_in_days = 4
}

### SCHEMAS DEV 

#F-DEV
resource "snowflake_schema" "SC_HR_F_DEV" {
  database = snowflake_database.BD_HR_DEV.name
  name     = "SC_HR_F_DEV"
  comment  = "This is the schema for F of DB-DEV"

  data_retention_days = 2
}

#M-DEV
resource "snowflake_schema" "SC_HR_M_DEV" {
  database = snowflake_database.BD_HR_DEV.name
  name     = "SC_HR_M_DEV"
  comment  = "This is the schema for M of DB-DEV"

  data_retention_days = 2
}

### SCHEMAS PRO 

#F-PRO
resource "snowflake_schema" "SC_HR_F_PRO" {
  database = snowflake_database.BD_HR_PRO.name
  name     = "SC_HR_F_PRO"
  comment  = "This is the schema for F of DB-PRO"

  data_retention_days = 4
}

#M-PRO
resource "snowflake_schema" "SC_HR_M_PRO" {
  database = snowflake_database.BD_HR_PRO.name
  name     = "SC_HR_M_PRO"
  comment  = "This is the schema for M of DB-PRO"

  data_retention_days = 4
}

### TABLES - DEV

## TB-F-DEV
resource "snowflake_table" "TB_HR_F_DEV" {
  database  = snowflake_schema.SC_HR_F_DEV.database
  schema = snowflake_schema.SC_HR_F_DEV.name
  name  = "TB_HR_F_DEV"
  comment = "This is the table of SC-F of DEV"

    column {
        name = "Name"
        type = "text"
        nullable = false
    }

    column {
        name = "Identity"
        type = "text"
        nullable = true
    }

    column {
        name = "Publisher"
        type = "text"
        nullable = true
    }

    column {
        name = "Gender"
        type = "text"
        nullable = true
    }

    column {
        name = "First appearance"
        type = "text"
        nullable = true
    }

    column {
        name = "Eye color"
        type = "text"
        nullable = true
    }

    column {
        name = "Hair color"
        type = "text"
        nullable = true
    }

    column {
        name = "Strength"
        type = "int"
        nullable = true
    }

    column {
        name = "Intelligence"
        type = "text"
        nullable = true
    }
}

## TB-M-DEV
resource "snowflake_table" "TB_HR_M_DEV" {
  database  = snowflake_schema.SC_HR_M_DEV.database
  schema = snowflake_schema.SC_HR_M_DEV.name
  name  = "TB_HR_M_DEV"
  comment = "This is the table of SC-M of DEV"

    column {
        name = "Name"
        type = "text"
        nullable = false
    }

    column {
        name = "Identity"
        type = "text"
        nullable = true
    }

    column {
        name = "Publisher"
        type = "text"
        nullable = true
    }

    column {
        name = "Gender"
        type = "text"
        nullable = true
    }

    column {
        name = "First appearance"
        type = "text"
        nullable = true
    }

    column {
        name = "Eye color"
        type = "text"
        nullable = true
    }

    column {
        name = "Hair color"
        type = "text"
        nullable = true
    }

    column {
        name = "Strength"
        type = "int"
        nullable = true
    }

    column {
        name = "Intelligence"
        type = "text"
        nullable = true
    }
}

### TABLES - PRO

## TB-F-PRO
resource "snowflake_table" "TB_HR_F_PRO" {
  database  = snowflake_schema.SC_HR_F_PRO.database
  schema = snowflake_schema.SC_HR_F_PRO.name
  name  = "TB_HR_F_PRO"
  comment = "This is the table of SC-F of PRO"

    column {
        name = "Name"
        type = "text"
        nullable = false
    }

    column {
        name = "Identity"
        type = "text"
        nullable = true
    }

    column {
        name = "Publisher"
        type = "text"
        nullable = true
    }

    column {
        name = "Gender"
        type = "text"
        nullable = true
    }

    column {
        name = "First appearance"
        type = "text"
        nullable = true
    }

    column {
        name = "Eye color"
        type = "text"
        nullable = true
    }

    column {
        name = "Hair color"
        type = "text"
        nullable = true
    }

    column {
        name = "Strength"
        type = "int"
        nullable = true
    }

    column {
        name = "Intelligence"
        type = "text"
        nullable = true
    }
}

## TB-M-PRO
resource "snowflake_table" "TB_HR_M_PRO" {
  database  = snowflake_schema.SC_HR_M_PRO.database
  schema = snowflake_schema.SC_HR_M_PRO.name
  name  = "TB_HR_M_PRO"
  comment = "This is the table of SC-M of PRO"

    column {
        name = "Name"
        type = "text"
        nullable = false
    }

    column {
        name = "Identity"
        type = "text"
        nullable = true
    }

    column {
        name = "Publisher"
        type = "text"
        nullable = true
    }

    column {
        name = "Gender"
        type = "text"
        nullable = true
    }

    column {
        name = "First appearance"
        type = "text"
        nullable = true
    }

    column {
        name = "Eye color"
        type = "text"
        nullable = true
    }

    column {
        name = "Hair color"
        type = "text"
        nullable = true
    }

    column {
        name = "Strength"
        type = "int"
        nullable = true
    }

    column {
        name = "Intelligence"
        type = "text"
        nullable = true
    }
}