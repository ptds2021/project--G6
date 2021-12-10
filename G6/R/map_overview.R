
map_overview <- function(record_type){

  library(tidyverse)
  library(dplyr)
  library(plotly)

  data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))
  # Create a data frame of map data
  mapdata <- map_data("world") %>%
             rename(country = region)

  # Create a subset of our data
  data_mostrecent <- data %>%
                     filter(record == record_type & year == 2016)

  # Add coordinates to our data
  data_mostrecent <- left_join(mapdata,
                               data_mostrecent,
                               by = "country")

  # Plot the map
  map1 <- ggplot(data_mostrecent,
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
           tooltip = "text")

}



