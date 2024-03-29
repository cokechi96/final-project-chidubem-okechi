library(tidyverse)
library(fixest)
library(modelsummary)
library(gt)
library(flextable)

processed_data <- as_tibble(read.csv("Input/processed_data.csv"))

## With Outliers
## Without IV
model <- feols(quantity ~ price, data = processed_data)

## WIth IV
model_iv <- feols(quantity ~ 1 | price ~ legislation_count,
data = processed_data)

## Save models to docx and md
modelsummary(list(model, model_iv), output = "Output/models.docx")
modelsummary(list(model, model_iv), output = "Output/models.md")


## Removing Outliers
processed_data <- processed_data |>
  filter(quantity <= 70000)|>
  filter(quantity >= 30000)

## Without IV
NO_model <- feols(quantity ~ price, data = processed_data)

## WIth IV
NO_model_iv <- feols(quantity ~ 1 | price ~ legislation_count,
data = processed_data)

## Save models to docx and md
modelsummary(list(NO_model, NO_model_iv), output = "Output/NO_models.docx")
modelsummary(list(NO_model, NO_model_iv), output = "Output/NO_models.md")
