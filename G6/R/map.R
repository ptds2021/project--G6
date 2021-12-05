library(ggplot2)
library(tidyverse)
library(maps)
library(dplyr)
library(ggiraph)
library(sp)
library(sf)
library(plotly)
library(gganimate)
library(transformr)
library(readr)

# ------------------------------------------------------

country_chosen <- data %>%
                  select(country, crop_land, year, record) %>% # shiny app: user input can choose the second parameter
                  filter(country == "Switzerland" & record == "EFProdTotGHA") # shiny app: user input

country_chosen <- left_join(mapdata,
                            country_chosen,
                            by = "country")

country_chosen2 <- country_chosen %>% filter(country == "Switzerland")

map2 <- ggplot(data = country_chosen2,
               mapping = aes(x = long,
                             y = lat,
                             group = group)) +

        geom_polygon(aes(fill = crop_land))  # shiny app: user input

map_anim <- map2 +
            transition_time(country_chosen2$year) +
            ggtitle('Year: {frame_time}',
                    subtitle = 'Frame {frame} of {nframes}')

num_years <- max(country_chosen2$year) - min(country_chosen2$year) + 1

animate(map_anim,
        nframes = num_years)


