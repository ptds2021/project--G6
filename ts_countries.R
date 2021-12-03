library(dplyr)
library(tidyverse)
library(tsibble)
library(fpp3)
library(reshape2)



#read data
data <- read_csv(here::here("data/NFA 2019 public_data.csv"))

country_list <- list("Switzerland", "Italy","France", "Germany")

# select variables and filter for country and record
data_country_ts <- data %>% select(year, country, record , crop_land) %>% filter(country %in% country_list & record == "EFProdPerCap")


data_country_ts <- data_country_ts %>% tsibble(index = year, key = country) %>% mutate(crop_land = as.double(crop_land))

#no forecast
data_country_ts %>% autoplot(crop_land)+ggtitle("Time series by country and year")+xlab("year")+ylab(paste0("for record : ", data_country_ts$record[1]))




#forecast
fit <- data_country_ts %>% model(ARIMA(crop_land))

fit %>% forecast(h = 10) %>% autoplot(data_country_ts)+ggtitle("Time series by country and year")+xlab("year")+ylab(paste0("for record : ", data_country_ts$record[1]))
  
  




