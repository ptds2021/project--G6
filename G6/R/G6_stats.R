#' @title Statistics
#' @description The function returns a kable displaying statistics for selected country/ies, record type, production surface area's type and selected period. The statistics displayed are the minimum, median, mean, standard deviation, maximum, evolution and world proportion.
#' @param countries_list List of countries chosen by the user.
#' @param record_type Record chosen by the user.
#' @param indicator Indicator selected by the user (crop land, grazing land, forest land, fishing ground, built-up land, carbon and total).
#' @param year_range Period over which the statistics are given.
#' @return A table of statistics
#' @export
#' @examples
#' G6_stats(c("France", "Switzerland", "World"), "AreaPerCap", "crop_land", (1990:2010))

G6_stats <- function (countries_list, record_type, indicator, year_range){

  library(dplyr)

  data <- readr::read_csv(here::here("NFA_2019_public_data.csv"))

  if ("World" %in% countries_list){

    # select variables and filter for country and record
    data_stats <- data %>%
                  dplyr::select(year, country, record, {{indicator}}) %>%
                  dplyr::filter(country %in% countries_list & record == record_type)

    colnames(data_stats)<- c("year", "country", "record", "indicator")

    # change indicator type to numeric
    data_stats$indicator<- as.numeric(as.character(data_stats$indicator))

    # filter by year range
    data_stats <- data_stats %>%
                  dplyr::filter(year %in% year_range)

    # compute the value of all countries for comparison
    global <- data %>%
              dplyr::select(year, country, record, {{indicator}}) %>%
              dplyr::filter(year %in% year_range) %>%
              dplyr::filter(country != "World")

    colnames(global) <- c("year", "country", "record", "indicator")

    global$indicator <- as.numeric(as.character(global$indicator))

    # sum all the values
    total_countries <- sum(global$indicator,na.rm = TRUE)

    # compute the mean for the world
    mean_world <- data_stats %>%
                  dplyr::filter(country == "World")

    mean_world <-  mean(mean_world$indicator)

    # group by country and compute all the statistics
    summary <- data_stats %>%
               dplyr::group_by(country) %>%
               dplyr::summarise(min = min(indicator),
                                median = stats::median(indicator),
                                mean = mean(indicator),
                                sd = stats::sd(indicator),
                                max = max(indicator),
                                total = sum(indicator, na.rm = TRUE),
                                evolution = ((last(indicator)-first(indicator))/first(indicator))*100,
                                world_mean_diff = mean(indicator)/mean_world,
                                global_proportion = total/total_countries)

    return(summary)

  } else { # won't display world, because it isn't selected by the user

    # select variables and filter for country and record
    data_stats <- data %>%
                  dplyr::select(year, country, record, {{indicator}}) %>%
                  dplyr::filter(country %in% countries_list & record == record_type)

    # create a dataframe with country world, to compute later the proportion of a country compared to the world
    data_world <- data %>%
                  dplyr::select(year, country, record, {{indicator}}) %>%
                  dplyr::filter(country == "World" & record == record_type)

    # merging the two dataset
    data_stats <- rbind(data_stats,data_world)

    colnames(data_stats)<- c("year", "country", "record", "indicator")

    # change indicator type to numeric
    data_stats$indicator<- as.numeric(as.character(data_stats$indicator))

    # filter by year range
    data_stats <- data_stats %>%
                  dplyr::filter(year %in% year_range)

    # compute the value of all countries for comparison
    # compute the value of all countries for comparison
    global <- data %>%
              dplyr::select(year, country, record, {{indicator}}) %>%
              dplyr::filter(year %in% year_range)

    colnames(global) <- c("year", "country", "record", "indicator")

    global$indicator <- as.numeric(as.character(global$indicator))

    # sum all the values
    total_countries <- sum(global$indicator, na.rm = TRUE)


    # compute the mean for the world
    mean_world <- data_stats %>%
                  dplyr::filter(country == "World")

    mean_world <-  mean(mean_world$indicator)

    # group by country and compute all the statistics
    summary <- data_stats %>%
               dplyr::group_by(country) %>%
               dplyr::summarise(min = min(indicator),
                                median = stats::median(indicator),
                                mean = mean(indicator),
                                sd = stats::sd(indicator),
                                max = max (indicator),
                                total = sum (indicator, na.rm = TRUE),
                                evolution = ((dplyr::last(indicator)-dplyr::first(indicator))/first(indicator))*100,
                                world_proportion = mean(indicator)/mean_world,

                                global_proportion = total/total_countries)

    # remove world because it was not selected
    summary <- summary %>%
               dplyr::filter(country != "World")

    return(summary)

  }
}

print(G6_stats(c("France", "Switzerland", "World"),"AreaPerCap", "crop_land",(1990:2010)))


