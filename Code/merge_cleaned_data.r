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