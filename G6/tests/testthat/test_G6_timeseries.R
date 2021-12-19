# Test G6_timeseries

# Test whether the timeseries is visible
test_that("The outcome is line plot of the evolution of EF", {
  timeseries_plot <- G6::G6_timeseries("Argentina", "EFProdTotGHA", "fishing_ground", "No", 4)
  expect_visible(timeseries_plot)
})

# Test whether the timeseries with forecast is visible
test_that("The outcome is line plot of the evolution of EF with forecasting", {
  timeseries_forecast <- G6::G6_timeseries("Argentina", "EFProdTotGHA", "fishing_ground", "Yes", 4)
  expect_visible(timeseries_forecast)
})
