
library(tidyverse)
library(fixest)
library(modelsummary)
library(gt)
library(flextable)
library(data.table)
library(lubridate)
library(dplyr)
library(tseries)
library(zoo)

m_processed_data <- as_tibble(read.csv("Input/manually_processed_data.csv"))


## Interpolation to convert yearly to monthly (for statistical significance)
m_processed_data$year2 <- as.Date(m_processed_data$year, format = "%d/%m/%Y")

monthly <- seq(m_processed_data$year2[1], 
 tail(m_processed_data$year2, 1), by = "month")

quantity <- m_processed_data[c("year2", "quantity")]
quantity2 <- data.frame(year2 = monthly, quantity2 = spline(quantity,
 method = "fmm", xout = monthly)$y)

price <- m_processed_data[c("year2", "price")]
price2 <- data.frame(year2 = monthly, price2 = spline(price,
 method = "fmm", xout = monthly)$y)

renewable_share <- m_processed_data[c("year2", "renewable_share")]
renewable_share2 <- data.frame(year2 = monthly, renewable_share2
 = spline(renewable_share, method = "fmm", xout = monthly)$y)

rig_count <- m_processed_data[c("year2", "rig_count")]
rig_count2 <- data.frame(year2 = monthly, rig_count2
 = spline(rig_count, method = "fmm", xout = monthly)$y)

dollar_index <- m_processed_data[c("year2", "dollar_index")]
dollar_index2 <- data.frame(year2 = monthly, dollar_index2
 = spline(dollar_index, method = "fmm", xout = monthly)$y)

legislation_count <- m_processed_data[c("year2", "legislation_count")]
legislation_count2 <- data.frame(year2 = monthly, legislation_count2
 = approx(legislation_count, method = "linear", xout = monthly)$y)

cumulative_legislation_count <- m_processed_data[c("year2", "cumulative_lc")]
cumulative_legislation_count2 <- data.frame(year2 = monthly, cumulative_legislation_count2
 = approx(cumulative_legislation_count, method = "linear", xout = monthly)$y)

population <- m_processed_data[c("year2", "population")]
population2 <- data.frame(year2 = monthly, population2
 = spline(population, method = "fmm", xout = monthly)$y)
## population2$date <- as.character(population2$year2)

## Merge interpolated variables
id1 <- merge(quantity2, price2, by = "year2")
id2 <- merge(id1, renewable_share2, by = "year2")
id3 <- merge(id2, rig_count2, by = "year2")
id4 <- merge(id3, dollar_index2, by = "year2")
id5 <- merge(id4, legislation_count2, by = "year2")
id6 <- merge(id5, cumulative_legislation_count2, by = "year2")
interpolated_data <- merge(id6, population2, by = "year2")

## Run regressions using interpolated data
## Without instrument
NO_model <- feols(log(quantity2) ~ log(price2) + log(renewable_share2) 
 + log(rig_count2) + log(population2) + log(dollar_index2),
 data = interpolated_data)

## With instrument
NO_model_iv <- feols(log(quantity2) ~ log(renewable_share2) + log(rig_count2) 
 + log(population2) + log(dollar_index2) | log(price2) ~ log(cumulative_legislation_count2),
 data = interpolated_data)