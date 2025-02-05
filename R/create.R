create_column <- function(table_name, column_name, column_type, con){
  query <- glue::glue("
    ALTER TABLE public.{table_name}
    ADD COLUMN {column_name} {column_type};")
  dbExecute(db_con, query)
}

create_station <- function(table_name, con){
  query <- glue::glue("
    CREATE TABLE public.{table_name} (
    timestamp TIMESTAMP  without time zone PRIMARY KEY
    );")
  dbExecute(db_con, query)

  query <- glue::glue("
    CREATE INDEX {table_name}_timestamp
    ON public.{table_name} (timestamp);")
}
