#' @title World Map
#' @description Plot a world map displaying countries ecological footprintS.
#' @return A World Map with the countries ecological footprint.
#' @export


worldmap <- function(country_selected, indicator, record_chosen) {


  
  data <- read_csv(here::here("NFA 2019 public_data.csv"))

# Create a data frame of map data
mapdata <- ggplot2::map_data("world") %>%
           rename(country = region)

subset_country <- data %>%
                  dplyr::select(country, indicator, year, record) %>% # shiny app: user input can choose the second parameter
                  dplyr::filter(country %in% country_selected & record == record_chosen) # shiny app: user input

subset_country <- dplyr::left_join(mapdata,
                            subset_country,
                            by = "country")

subset_country2 <- subset_country %>% dplyr::filter(country %in% country_selected)

map2 <- ggplot2::ggplot(data = subset_country2,
               mapping = ggplot2::aes(x = long,
                             y = lat,
                             group = group)) +

        ggplot2::geom_polygon(ggplot2::aes(fill = indicator))  # shiny app: user input

map_anim <- map2 +
            gganimate::transition_time(subset_country2$year) +
            ggplot2::ggtitle('Year: {frame_time}',
                    subtitle = 'Frame {frame} of {nframes}')

num_years <- max(subset_country2$year) - min(subset_country2$year) + 1

gganimate::animate(map_anim,
        nframes = num_years)
 

}

country_list <- c("China","Switzerland")

worldmap(country_list, "carbon", "EFProdTotGHA")
