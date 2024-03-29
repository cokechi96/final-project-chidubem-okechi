
library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

clean_quantity_data <- function(qdata) {
  qdata <- qdata[-1,] |>
   mutate(quantity = rowSums(qdata[-1,-1], na.rm = TRUE))

  row.names(qdata) <- NULL

  qdata <- qdata |> dplyr::rename(month_year = Country) # nolint

  qdata <- qdata |>
   mutate(formatted_date = format(my(month_year),"%Y-%m")) # nolint

  qdata <- qdata |>
   mutate(year = lubridate::year(ym(formatted_date)), # nolint
   month = lubridate::month(ym(formatted_date)))

  qdata <- qdata |>
   select(year, month, quantity) # nolint
}