library(dbplyr)
library(dplyr)
library(DBI)
library(bigrquery)

con <- DBI::dbConnect(
  bigrquery::bigquery(),
  project = "extended-tenure-345822",
  dataset = "naci_ed",
  billing = "extended-tenure-345822"
)
con
DBI::dbListTables(con)
DBI::dbReadTable(con, "colocation", n_max = 10)

sql_basic <- "SELECT * FROM `extended-tenure-345822.naci_ed.colocation`"

DBI::dbGetQuery(con, sql_basic, n = 10)
con %>% tbl("naci_ed.colocation")


