#' @title Time Series Plot
#' @description The function returns a times series of the evolution of different production surface areas' ecological footprint over the years for selected country/ies. The plot can display some forecasting if the user selects the option to do so.
#' @param countries_list List of countries chosen by the user.
#' @param record_type Record chosen by the user.
#' @param indicator Indicator selected by the user (crop land, grazing land, forest land, fishing ground, built-up land, carbon and total).
#' @param doforecast Option to display forecasts or not.
#' @param yearforecast Number of years over which to forecast.
#' @return A Time Series of the evolution of ecological footprint of chosen countries.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' country_list <- list("Spain", "Italy","France", "Germany","Switzerland")
#' timeseries(country_list, "EFProdTotGHA", "fishing_ground", "No", 10)

timeseries <- function(countries_list, record_type, indicator, doforecast, yearforecast){

  #read data
  data <- readr::read_csv(system.file("extdata", "NFA_2019_public_data.csv", package = "G6"))


  # select variables and filter for country and record
  data_country_ts <- data %>%
                     dplyr::select(year, country, record, {{indicator}}) %>%
                     dplyr::filter(country %in% countries_list & record == record_type)

  data_country_ts <- data_country_ts %>%
                     tsibble::tsibble(index = year, key = country) %>%
                     dplyr::mutate(indicator_name = as.double(data_country_ts[[indicator]]))

  if(doforecast == "No"){

    #no forecast
    standard_plot <- data_country_ts %>%
                     feasts::autoplot(indicator_name) +
                     ggplot2::ggtitle("Time series by country and year") +
                     ggplot2::xlab("year") +
                     ggplot2::ylab(paste0("for record: ", data_country_ts$record[1]))

    return(standard_plot)

  }else{

    #forecast
    fit <- data_country_ts %>%
           fabletools::model(fable::ARIMA(indicator_name))

    forecast_plot <- fit %>%
                     fabletools::forecast(h = yearforecast) %>%
                     feasts::autoplot(data_country_ts) +
                     ggplot2::ggtitle("Time series by country and year") +
                     ggplot2::xlab("year") +
                     ggplot2::ylab(paste0("for record : ", data_country_ts$record[1]))

    return(forecast_plot)
  }

}



