library(dplyr)
library(tidyverse)
library(tsibble)
library(fpp3)
library(reshape2)
library(readr)

carb_countries_ts <- function(countries_list, record_type, indicator, doforecast, yearforecast){

  #read data
  data <- read_csv(here::here("NFA 2019 public_data.csv"))


  # select variables and filter for country and record
  data_country_ts <- data %>%
                     select(year, country, record , !!indicator) %>%
                     filter(country %in% country_list & record == record_type)


  data_country_ts <- data_country_ts %>%
                     tsibble(index = year, key = country) %>%
                     mutate(index=as.double(!!indicator))

  if(doforecast == "No"){
    #no forecast
    standard_plot <- data_country_ts %>%
                     autoplot(index) +
                     ggtitle("Time series by country and year") +
                     xlab("year") +
                     ylab(paste0("for record : ", data_country_ts$record[1]))

    return(standard_plot)
  }

  else{
    #forecast
    fit <- data_country_ts %>%
           model(ARIMA(index))

    forecast_plot < -fit %>%
                     forecast(h = yearforecast) %>%
                     autoplot(data_country_ts) +
                     ggtitle("Time series by country and year")+xlab("year") +
                     ylab(paste0("for record : ", data_country_ts$record[1]))

    return(forecast_plot)
  }


}

country_list <- list("Spain", "Italy","France", "Germany","Switzerland")

carb_countries_ts(country_list, "EFProdTotGHA", quo(fishing_ground), "No", 10)


