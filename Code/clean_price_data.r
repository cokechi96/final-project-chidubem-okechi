library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

price_raw <- read.csv("Raw Data/europe_brent_spot_price.csv", skip = 4)
headers <- c("month_year", "price")
colnames(price_raw) <- headers

price_raw <- price_raw |>
 mutate(formatted_date = format(my(month_year), "%Y-%m"))

price <- price_raw |>
 mutate(year = lubridate::year(ym(formatted_date)),
 month = lubridate::month(ym(formatted_date)))

price <- price |> select(year, month, price)

price <- price |> arrange(year, month)