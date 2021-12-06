#' @title World Map
#' @description Plot a world map displaying countries ecological footprintS.
#' @return A World Map with the countries ecological footprint.
#' @export
worldmap <- function() {
  data <- read_csv(here::here("NFA 2019 public_data.csv"))

# Create a data frame of map data
mapdata <- ggplot2::map_data("world") %>%
           rename(country = region)

country_chosen <- data %>%
                  dplyr::select(country, crop_land, year, record) %>% # shiny app: user input can choose the second parameter
                  dplyr::filter(country == "Switzerland" & record == "EFProdTotGHA") # shiny app: user input

country_chosen <- dplyr::left_join(mapdata,
                            country_chosen,
                            by = "country")

country_chosen2 <- country_chosen %>% dplyr::filter(country == "Switzerland")

map2 <- ggplot2::ggplot(data = country_chosen2,
               mapping = ggplot2::aes(x = long,
                             y = lat,
                             group = group)) +

        ggplot2::geom_polygon(ggplot2::aes(fill = crop_land))  # shiny app: user input

map_anim <- map2 +
            gganimate::transition_time(country_chosen2$year) +
            ggplot2::ggtitle('Year: {frame_time}',
                    subtitle = 'Frame {frame} of {nframes}')

num_years <- max(country_chosen2$year) - min(country_chosen2$year) + 1

gganimate::animate(map_anim,
        nframes = num_years)

}


