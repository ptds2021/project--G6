# Test timeseries

# Test whether the timeseries is visible
test_that("The outcome is a line plot of the EF evolution", {
  time_series <- G6::timeseries("Austria", "EFProdTotGHA", "fishing_ground", "No", 10)
  expect_visible(time_series)
})

# Test whether the forecasts are visible
test_that("The outcome is a line plot of the EF evolution", {
  forecasts <- G6::timeseries("Austria", "EFProdTotGHA", "fishing_ground", "Yes", 10)
  expect_visible(forecasts)
})

