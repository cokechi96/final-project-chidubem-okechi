library(ggplot2)
library(patchwork)

processed_data <- read.csv("Input/processed_data.csv")

## Time trends
a <- ggplot(data = processed_data, mapping = aes(x = year, y = price)) +
 geom_point()
b <- ggplot(data = processed_data, mapping = aes(x = year, y = quantity)) +
 geom_point()
c <- ggplot(data = processed_data, mapping = aes(x = year, y = legislation_count)) +
 geom_point()

## Other trends
d <- ggplot(data = processed_data, mapping = aes(x = price, y = quantity)) +
 geom_point()
e <- ggplot(data = processed_data, mapping = aes(x = legislation_count, y = quantity)) +
 geom_point()

## Combine plots
f <- (a | b | c) / (d | e)

## Save combined plot
ggsave("Output/Exploratory_charts.pdf", f, width = 8.5,
 height = 11, units = "in")
