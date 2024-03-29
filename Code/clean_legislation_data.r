library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)


climate_raw <- as_tibble(read.csv("Raw Data/climate_change_legislation.csv"))

## 
climate_raw$Last.event.in.timeline <-
 as.Date(climate_raw$Last.event.in.timeline, format = "%Y-%m-%d")

climate_mid <- climate_raw |>
 mutate(year = lubridate::year(Last.event.in.timeline),
 month = lubridate::month(Last.event.in.timeline),
 day = lubridate::day(Last.event.in.timeline))

legislation <- climate_mid |>
 group_by(year, month) |>
 summarize(count = n())

legislation[, "legislation_count"] <- cumsum(legislation[,3])

legislation <- legislation |>
 select(year, month, legislation_count)

legislation <- legislation |> arrange(year, month)