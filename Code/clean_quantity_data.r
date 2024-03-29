library(tidyverse)
library(data.table)
library(lubridate)
library(dplyr)

source("Code/helpers.r")

q1 <- read.csv("Raw Data/trade_quantity_data_first_batch.csv", skip = 4)
q2 <- read.csv("Raw Data/trade_quantity_data_second_batch.csv", skip = 4)
q3 <- read.csv("Raw Data/trade_quantity_data_third_batch.csv", skip = 4)

q1 <- clean_quantity_data(q1)
q2 <- clean_quantity_data(q2)
q3 <- clean_quantity_data(q3)

quantity <- rbind(q1, q2, q3)

quantity <- quantity |> arrange(year, month)