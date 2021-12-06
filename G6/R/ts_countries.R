#' @title Time Series Plot
#' @description Plot Times Series of countries ecological footprints, to observe its evolution over time.
#' @param countries_list List of countries chosen by the user.
#' @param record_type Record chosen by the user.
#' @param doforecast Forecast.
#' @param yearforecast Number of year for which do the forecast.
#' @return A Time Series plot with the chosen countries ecological footprint.
#' @export
#' @examples
#' country_list <- list("Spain", "Italy","France", "Germany","Switzerland")
#' carb_countries_ts(country_list, "EFProdTotGHA", quo(fishing_ground), "No", 10)
carb_countries_ts <- function(countries_list, record_type, indicator, doforecast, yearforecast){

  #read data
  data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))


  # select variables and filter for country and record
  data_country_ts <- data %>%
                     dplyr::select(year, country, record , !!indicator) %>%
                     dplyr::filter(country %in% country_list & record == record_type)


  data_country_ts <- data_country_ts %>%
                     tsibble::tsibble(index = year, key = country) %>%
                     dplyr::mutate(index=as.double(!!indicator))

  if(doforecast == "No"){
    #no forecast
    standard_plot <- data_country_ts %>%
                     autoplot(index) +
                     ggplot2::ggtitle("Time series by country and year") +
                     ggplot2::xlab("year") +
                     ggplot2::ylab(paste0("for record : ", data_country_ts$record[1]))

    return(standard_plot)
  }

  else{
    #forecast
    fit <- data_country_ts %>%
           model(ARIMA(index))

    forecast_plot < -fit %>%
                     forecast(h = yearforecast) %>%
                     autoplot(data_country_ts) +
                     ggplot2::ggtitle("Time series by country and year") +
                     ggplot2::xlab("year") +
                     ggplot2::ylab(paste0("for record : ", data_country_ts$record[1]))

    return(forecast_plot)
  }


}

