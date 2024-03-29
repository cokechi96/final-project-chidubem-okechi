library(fixest)
library(modelsummary)
library(gt)
library(flextable)

processed_data <- read.csv("Input/processed_data.csv")

## Without IV
model <- feols(quantity ~ price, data = processed_data)
summary(model)

## WIth IV
model_iv <- feols(quantity ~ 1 | price ~ legislation_count,
 data = processed_data)


modelsummary(list(model, model_iv), output = "Output/models.docx")
modelsummary(list(model, model_iv), output = "Output/models.md")

gt(model)

#gof_map = c("nobs", "r.squared",