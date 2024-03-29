library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

## Only import the relevant rows
price_raw <- read.csv("Raw Data/europe_brent_spot_price.csv", skip = 4)
headers <- c("month_year", "price")
colnames(price_raw) <- headers

## Convert the relevant date column to useable date format
price_raw <- price_raw |>
 mutate(formatted_date = format(my(month_year), "%Y-%m"))

## Create separate columns for year and month
price <- price_raw |>
 mutate(year = lubridate::year(ym(formatted_date)),
 month = lubridate::month(ym(formatted_date)))

## Select relevant columns
price <- price |> select(year, month, price)

## Sort by year-month
price <- price |> arrange(year, month)