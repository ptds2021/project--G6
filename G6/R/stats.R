

display_stats <- function (countries_list, record_type, indicator, year_range){
library(dplyr)


data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))






if ("World" %in% countries_list){
  
  # select variables and filter for country and record
  data_stats <- data %>%
    dplyr::select(year, country, record , {{indicator}}) %>%
    dplyr::filter(country %in% countries_list & record == record_type)
  
  colnames(data_stats)<- c("year", "country", "record", "indicator")
  
  # change indicator type to numeric
  data_stats$indicator<- as.numeric(as.character(data_stats$indicator))
  
  # filter by year range
  data_stats <- data_stats %>% filter (year %in% year_range)
  
  # compute the mean for the world
  mean_world <- data_stats %>% filter (country == "World")
  mean_world <-  mean(mean_world$indicator)
  
  summary <- data_stats %>% group_by(country) %>% summarise (min = min(indicator), median = median(indicator), mean = mean(indicator), sd = sd(indicator), max = max (indicator), world_proportion = mean(indicator)/mean_world )
  
  return(summary)
}

else { # won't display world, because it isn't selected by the user
  
  # select variables and filter for country and record
  data_stats <- data %>%
    dplyr::select(year, country, record , {{indicator}}) %>%
    dplyr::filter(country %in% countries_list & record == record_type)
  
  # create a dataframe with country world, to compute later the proportion of a country compared to the world
  data_world <- data %>%
    dplyr::select(year, country, record , {{indicator}}) %>%
    dplyr::filter(country == "World" & record == record_type)
  
  # merging the two dataset
  data_stats <- rbind(data_stats,data_world)
  
  colnames(data_stats)<- c("year", "country", "record", "indicator")
  
  # change indicator type to numeric
  data_stats$indicator<- as.numeric(as.character(data_stats$indicator))
  
  
  # filter by year range
  data_stats <- data_stats %>% filter (year %in% year_range)
  
  # compute the mean for the world
  mean_world <- data_stats %>% filter (country == "World")
  mean_world <-  mean(mean_world$indicator)
  
  summary <- data_stats %>% group_by(country) %>% summarise (min = min(indicator), median = median(indicator), mean = mean(indicator), sd = sd(indicator), max = max (indicator), world_proportion = mean(indicator)/mean_world )
  
  # remove world because it was not selected
  summary <- summary %>% filter (country != "World")
  
  return(summary)
}

}



print(display_stats(c("France", "Switzerland", "World"),"AreaPerCap", "crop_land",(1990:2010)))
