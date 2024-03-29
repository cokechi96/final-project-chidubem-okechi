library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)


climate_raw <- as_tibble(read.csv("Raw Data/climate_change_legislation.csv"))

## Convert the relevant date column to date format
climate_raw$Last.event.in.timeline <-
 as.Date(climate_raw$Last.event.in.timeline, format = "%Y-%m-%d")

## Create separate columns for year, month, day
climate_mid <- climate_raw |>
 mutate(year = lubridate::year(Last.event.in.timeline),
 month = lubridate::month(Last.event.in.timeline),
 day = lubridate::day(Last.event.in.timeline))

## Count the number of legislation by year-month pair
legislation <- climate_mid |>
 group_by(year, month) |>
 summarize(count = n())

## Find the cumulative sum of the number of legislation over time
legislation[, "legislation_count"] <- cumsum(legislation[,3])

## Select relevant columns
legislation <- legislation |>
 select(year, month, legislation_count)

## Sort by year-month
legislation <- legislation |> arrange(year, month)