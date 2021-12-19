#' @title Time Series Plot
#' @description The function returns times series of the evolution of different production surface areas' ecological footprints over the years for one or more selected countries. The plot can display some forecasting if the user selects the option to do so.
#' @param countries_list List of countries chosen by the user.
#' @param record_type Record chosen by the user.
#' @param indicator Indicator selected by the user (crop land, grazing land, forest land, fishing ground, built-up land, carbon and total).
#' @param doforecast Option to display forecasts or not.
#' @param yearforecast Number of years over which to forecast.
#' @return A Time Series of the evolution of ecological footprint of chosen countries.
#' @importFrom magrittr "%>%"
#' @importFrom utils "install.packages"
#' @export
#' @examples
#' country_list <- list("Spain", "Italy","France", "Germany","Switzerland")
#' timeseries(country_list, "EFProdTotGHA", "fishing_ground", "No", 10)

timeseries <- function(countries_list, record_type, indicator, doforecast, yearforecast){

  if (!requireNamespace("fpp3", quietly = TRUE)){
    install.packages("fpp3")
  }

  library(fpp3)

  #read data
  data <- readr::read_csv(system.file("extdata", "NFA_2019_public_data.csv", package = "G6"))


  # select variables and filter for country and record
  data_country_ts <- data %>%
                     fpp3::select(year, country, record, {{indicator}}) %>%
                     fpp3::filter(country %in% countries_list & record == record_type)

  data_country_ts <- data_country_ts %>%
                     fpp3::tsibble(index = year, key = country) %>%
                     fpp3::mutate(indicator_name = as.double(data_country_ts[[indicator]]))

  if(doforecast == "No"){

    #no forecast
    standard_plot <- data_country_ts %>%
                     fpp3::autoplot(indicator_name) +
                     fpp3::ggtitle(paste("Time series by country and year for :",indicator)) +
                     fpp3::xlab("year") +
                     fpp3::ylab(paste0("for record: ", data_country_ts$record[1]))

    return(standard_plot)

  }else{

    #forecast
    fit <- data_country_ts %>%
           fabletools::model(fpp3::ARIMA(indicator_name))

    forecast_plot <- fit %>%
                     fabletools::forecast(h = yearforecast) %>%
                     forecast::autoplot(data_country_ts) +
                     fpp3::ggtitle(paste("Time series by country and year for :",indicator)) +
                     fpp3::xlab("year") +
                     fpp3::ylab(paste0("for record : ", data_country_ts$record[1]))

    return(forecast_plot)
  }

}



