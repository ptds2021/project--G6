# trying something 

library(readr)
library(here)
library(dplyr)
library(ggplot2)

# I want the user the choose the country, the column (crop_land, grazing_land, forest_land, fishing_ground, built-up land and carbon)

data <- read_csv(here::here("NFA 2019 public_data.csv"))

switzerland <- data %>% 
               filter(country == "Switzerland")

ggplot(switzerland,
       aes(x = year, y = crop_land, group = 1)) + 
  geom_path() +
  facet_grid(record + crop_land ~ carbon, margins = TRUE)


