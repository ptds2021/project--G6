#' @title Map by record type in 2016
#' @description The function returns an interactive World map of available countries displaying the total ecological footprint (crop land, grazing land, forest land, fishing ground, built-up land and carbon) of different production sites, by selected record type. The user can move the mouse cursor on a country and see more detailed information on the different production sites' ecological footprint.
#' @param record_type Record type selected by the user ("AreaPerCap", "AreaTotHA", "BiocapPerCap", "BiocapTotGHA", "EFConsPerCap", "EFConsTotGHA", "EFProdPerCap", "EFProdTotGHA")
#' @return An interactive World map
#' @export
#' @examples
#' worldmap_overview("AreaPerCap")

worldmap_overview <- function(record_type){

  data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))

  # Create a data frame of map data
  mapdata <- map_data("world")
  mapdata <- plyr::rename(mapdata, country = region)

  # Create a subset of our data
  data_mostrecent <- data %>%
                     dplyr::filter(record %in% record_type & year == 2016)

  # Add coordinates to our data
  data_mostrecent <- dplyr::left_join(mapdata,
                                      data_mostrecent,
                                      by = "country")

  # Plot the map
  map1 <- ggplot2::ggplot(data_mostrecent,
                          mapping = ggplot2::aes(x = long,
                                                 y = lat,
                                                 group = group, # change NA for a lighter grey colour
                                                 text = paste("Country: ", country,
                                                              "<br>Crop land: ", crop_land,
                                                              "<br>Grazing land: ", grazing_land,
                                                              "<br>Forest land: ", forest_land,
                                                              "<br>Fishing ground: ", fishing_ground,
                                                              "<br>Built-up land: ", built_up_land,
                                                              "<br>Total: ", total))) +

    ggplot2::geom_polygon(aes(fill = total)) +

    # Plot legends
    ggplot2::labs(title = "Total Ecological Footprint of Production (in gha) in 2016",
                  subtitle = "Note: grey colored countries have unavailable data",
                  caption = "source: GFN Country Code Concordance Table.csv",
                  fill = "Total Ecological Footprint of Production") +

    # Plot layout
    ggplot2::theme(rect = element_blank(),
             axis.ticks.y = element_blank(),
             axis.ticks.x = element_blank(),
             axis.text.y = element_blank(),
             axis.title.y = element_blank(),
             axis.title.x = element_blank(),
             axis.text.x = element_blank())  +

    ggplot2::theme(plot.title = element_text(hjust = 0.5))

  return(plotly::ggplotly(map1,
                  tooltip = "text"))

}



