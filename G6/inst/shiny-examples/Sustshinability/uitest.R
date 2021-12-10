# trying something 

library(readr)
library(here)
library(dplyr)
library(ggplot2)

# I want the user the choose the country, the column (crop_land, grazing_land, forest_land, fishing_ground, built-up land and carbon)

data <- read_csv(here::here("NFA 2019 public_data.csv"))

# Print class of every column
class <- sapply(data, class)

# Convert character to numeric
i <- c("crop_land", "grazing_land", "forest_land", "fishing_ground", "built_up_land", "carbon")
data <- data %>% 
  mutate_at(i, as.numeric) 

# data %>% str() # verification

# To be able to compare the values of the records we need to scale the data so that 
# it is on a comparable scale (compare apples with apples and not bananas)
data_scaled <- data %>% 
               mutate_at(i, scale)

# Create subset for a country 
switzerland <- data_scaled %>% 
               filter(country == "Switzerland")

# Plot faceted by record 
crop_land <- ggplot(switzerland,
                    aes(x = year, y = crop_land, group = 1)) + 
                    geom_path() +
                    facet_wrap(~record, 
                               scales = "free_y", 
                               ncol = 4)

                               



