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

x <- function()
        
        # Create a data frame of map data 
        mapdata <- map_data("world") %>%
                   rename(country = region)

        # Import our data
        data <- read_csv(here::here("data/NFA 2019 public_data.csv"))

        # Create a subset of our data
        EFProdTotGHA_mr <- data %>%
                           filter(record == "EFProdTotGHA" & year == 2016)

        # Add coordinates to our data 
        EFProdTotGHA_mr <- left_join(mapdata,
                                     EFProdTotGHA_mr,
                                     by = "country")

        # Plot the map
        map1 <- ggplot(EFProdTotGHA_mr,
                       mapping = aes(x = long,
                                     y = lat,
                                     group = group, # change NA for a lighter grey colour
                                     text = paste("Country: ", country,
                                                  "<br>Crop land: ", crop_land,
                                                  "<br>Grazing land: ", grazing_land,
                                                  "<br>Forest land: ", forest_land,
                                                  "<br>Fishing ground: ", fishing_ground,
                                                  "<br>Total: ", total))) +

                 geom_polygon(aes(fill = total)) +

                 # Plot legends
                 labs(title = "Total Ecological Footprint of Production (in gha) in 2016",
                      subtitle = "Note: grey colored countries have unavailable data",
                      caption = "source: GFN Country Code Concordance Table.csv",
                      fill = "Total Ecological Footprint of Production") +

                # Plot layout
                theme(rect = element_blank(),
                      axis.ticks.y = element_blank(),
                      axis.ticks.x = element_blank(),
                      axis.text.y = element_blank(),
                      axis.title.y = element_blank(),
                      axis.title.x = element_blank(),
                      axis.text.x = element_blank())  +
                
                theme(plot.title = element_text(hjust = 0.5))

        ggplotly(map1,
                 tooltip = "text") # modfiy tooltip

# -------------

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


