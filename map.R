
library(ggiraph)
library(leaflet)
library(ggplot2)
library(broom)
library(tmap)

map <- ggplot() + 
  geom_polygon_interactive(data = world_data, color = 'gray70', size = 0.1,
                           aes(x = long, y = lat, fill = Value, group = group, 
                               tooltip = sprintf("%s<br/>%s", ISO3, Value))) + 
  scale_fill_gradientn(colours = brewer.pal(5, "RdBu"), na.value = 'white') + 
  scale_y_continuous(limits = c(-60, 90), breaks = c()) + 
  scale_x_continuous(breaks = c()) + 
  labs(fill = data_type, color = data_type, title = NULL, x = NULL, y = NULL, caption = capt) + 
  my_theme()



world_data <- ggplot2::map_data('world')
world_data <- tidy(world_data)
map <- world_data %>% ggplot() + 
  geom_polygon_interactive(data = world_data, color = 'gray70', size = 0.1,
                           aes(x = long, y = lat, group = group
                               ))











map_world <- addTiles(leaflet())
map_world

# Create a continuous palette function
pal <- colorNumeric(
  palette = "Blues",
  domain = data$crop_land)


map_world %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 1,
              color = ~pal(crop_land))



EFProdTotGHA_mr <- data %>% filter(record == "EFProdTotGHA" & year == 2016)

data("World")
tm_shape(World) + 
  tm_polygons() + 
  tm_shape(EFProdTotGHA_mr)
  tmap_mode("view") + 
  tm_style("col_blind")

# Pour la Shiny: utilisateur peut choisir l'année ?

# ------------------------------
  
library(ggplot2)
library(tidyverse)
library(maps)
library(dplyr)
library(ggiraph)
library(sp)
library(sf)
library(plotly)

  
EFProdTotGHA_mr <- data %>% 
                   filter(record == "EFProdTotGHA" & year == 2016)
  
mapdata <- map_data("world") %>%
           rename(country = region)
  
EFProdTotGHA_mr <- left_join(mapdata, 
                             EFProdTotGHA_mr,
                             by = "country") 

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
              axis.text.x = element_blank()) 
  
ggplotly(map1,
         tooltip = "text") # modfiy tooltip 

  

