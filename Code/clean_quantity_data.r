library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

q1 <- read.csv("Raw Data/trade_quantity_data_first_batch.csv", skip = 4)
q2 <- read.csv("Raw Data/trade_quantity_data_second_batch.csv", skip = 4)
q3 <- read.csv("Raw Data/trade_quantity_data_third_batch.csv", skip = 4)

## Source the helper code for useful function
source("Code/helpers.r")

## Use function to clean data
q1 <- clean_quantity_data(q1)
q2 <- clean_quantity_data(q2)
q3 <- clean_quantity_data(q3)

## Stack the three batches
quantity <- rbind(q1, q2, q3)

## Sort by year-month
quantity <- quantity |> arrange(year, month)