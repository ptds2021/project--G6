#' @title Ecological Footprint Plot
#' @description Plot countries ecological footprints so that we can compare them.
#' @param countries_select Countries user is selecting to observe their ecological footprint.
#' @return A plot with the chosen countries ecological footprint.
#' @export
#' @examples
#' countries <- list("China","Germany","India")
#' sustainability(countries)
sustainability <- function(countries_select) {


data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))

## Creation
sustain <- data %>%
           dplyr::filter(record == "BiocapPerCap" | record == "EFConsPerCap") %>%
           dplyr::group_by(year, country) %>%
           dplyr::summarise(sustainablity = - diff(total))

sustbycountry <- dplyr::filter(sustain,
                        country %in% countries_select)

plot_countries <- ggplot2::ggplot(sustbycountry,
                         mapping = ggplot2::aes(x = year,
                                       y = sustainablity,
                                       fill = factor(country))) +

                  # Create bar plot
                  ggplot2::geom_bar(stat = "identity",
                           position = "dodge") +

                  ggplot2::labs(title = "Sustainability by country per year",
                       fill = "Country")

return(plot_countries)

}

