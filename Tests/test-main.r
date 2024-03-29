library(testthat)

## Import processed data from input folder
data <- fread("./Input/processed_data.csv")

## Test that the number of observations is 265
test_that("number of observations equal 265", {
    expect_equal(nrow(data), 265)
})