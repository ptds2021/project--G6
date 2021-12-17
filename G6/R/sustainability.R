#' @title Sustainability Plot
#' @description The function returns a bar plot showing the difference per year between the biocapacity (in gha) divided by the population and the ecological footprint of production (in gha) divided by the population. Each bar shows then a sustainability value which can be positive or negative. If the value is positive, this means that a country for one year is sustainable (i.e. it has more biocapacity than what it actually uses).
#' @param countries_select Country/ies selected by the user.
#' @return A bar plot displaying the consumed biocapacity
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' countries <- list("China","Germany","India")
#' sustainability(countries)

sustainability <- function(countries_select) {



  data <- readr::read_csv(here::here("data/NFA_2019_public_data.csv"))

  ## Creation
  sustain <- data %>%
             dplyr::filter(record == "BiocapPerCap" | record == "EFConsPerCap") %>%
             dplyr::group_by(year, country) %>%
             dplyr::summarise(sustainability = - diff(total))

  sustbycountry <- dplyr::filter(sustain,
                                 country %in% countries_select)

  plot_countries <- ggplot2::ggplot(sustbycountry,
                                    mapping = ggplot2::aes(x = year,
                                                           y = sustainability,
                                                           fill = factor(country))) +

                    # Create bar plot
                    ggplot2::geom_bar(stat = "identity",
                                      position = "dodge") +

                    ggplot2::labs(title = "Sustainability by country per year",
                                  fill = "Country")

return(plot_countries)

}

