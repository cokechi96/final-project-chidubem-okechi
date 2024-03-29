
library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

## Loop through the rows in the data
clean_quantity_data <- function(qdata) {
  ## Remove empty row
  qdata <- qdata[-1,] |>
   mutate(quantity = rowSums(qdata[-1,-1], na.rm = TRUE))

  ## Reset index
  row.names(qdata) <- NULL

  ## Rename column
  qdata <- qdata |> dplyr::rename(month_year = Country) # nolint

  ## Convert the relevant date column to date format
  qdata <- qdata |>
   mutate(formatted_date = format(my(month_year),"%Y-%m")) # nolint

  ## Create separate columns for year and month
  qdata <- qdata |>
   mutate(year = lubridate::year(ym(formatted_date)), # nolint
   month = lubridate::month(ym(formatted_date)))

  ## Select relevant columns
  qdata <- qdata |>
   select(year, month, quantity) # nolint
}