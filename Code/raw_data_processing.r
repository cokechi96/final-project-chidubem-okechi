
library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

source("Code/helpers.r")

## Legislation data
climate_raw <- as_tibble(read.csv("Raw Data/climate_change_legislation.csv"))

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


## Price data
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


## Quantity data
q1 <- read.csv("Raw Data/trade_quantity_data_first_batch.csv", skip = 4)
q2 <- read.csv("Raw Data/trade_quantity_data_second_batch.csv", skip = 4)
q3 <- read.csv("Raw Data/trade_quantity_data_third_batch.csv", skip = 4)

q1 <- clean_quantity_data(q1)
q2 <- clean_quantity_data(q2)
q3 <- clean_quantity_data(q3)

quantity <- rbind(q1, q2, q3)

quantity <- quantity |> arrange(year, month)


source("Code/clean_quantity_data.r")
source("Code/clean_price_data.r")
source("Code/clean_legislation_data.r")

## Merge legislation, price, quantity
oil_data1 <- left_join(price, quantity, by = c("month", "year"))
oil_data2 <- left_join(oil_data1, legislation, by = c("month", "year"))

for (i in 2:nrow(oil_data2)) {
  if (is.na(oil_data2$legislation_count[i]) == TRUE) {
    oil_data2$legislation_count[i] <- oil_data2$legislation_count[i - 1]
  }
}

## Export processed data as csv
processed_data <- na.omit(oil_data2)
fwrite(processed_data, "Input/processed_data.csv")
