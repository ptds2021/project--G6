library(shiny)

data <- readr::read_csv(here::here("NFA 2019 public_data.csv"))

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Add theme
  theme = bslib::bs_theme(bootswatch = "flatly"),

  titlePanel(
    h1(paste0("Sustshinability")),
    h2("This shiny app allows to explore data on x countries from t to t by ...")
  ),

  # Add toc
  navlistPanel(
    id = "tabset",
    tabPanel("World Overview",
             selectInput("record", "Choose a record type:",
                         c(unique(data$record)),
                         multiple = FALSE),
             plotOutput("Map Overview")),
    tabPanel("Sustainability",
             selectInput("country", "Choose a country:",
                         c(unique(data$country)),
                         multiple = TRUE),
             plotOutput("Sustainibility plot")),
    tabPanel("Timeseries",
             selectInput("countries_ts","choose countries:",
                         c(unique(data$country)),
                         multiple = TRUE),
             selectInput("record_ts", "Choose a record type:",
                         c(unique(data$record)),
                         multiple = FALSE),
             selectInput("indicator_ts", "Choose an indicator:",
                         c("crop_land","grazing_land","forest_land","fishing_ground","built_up_land","carbon","total"),
                         multiple = FALSE),
             selectInput("doforecast", "Choose to forcast:",
                         c("Yes","No"),
                         multiple = FALSE),
             sliderInput(inputId = "yearforecast",
                         label = "Number of years to forecast:",
                         min = 1,
                         max = 50,
                         value = 30),
             plotOutput("Timeseries")
    ),
    tabPanel("Statistics",
             selectInput("countries_st","choose countries:",
                         c(unique(data$country)),
                         multiple = TRUE),
             selectInput("record_st", "Choose a record type:",
                         c(unique(data$record)),
                         multiple = FALSE),
             selectInput("indicator_st", "Choose an indicator:",
                         c("crop_land","grazing_land","forest_land","fishing_ground","built_up_land","carbon","total"),
                         multiple = FALSE),
             selectInput(
               inputId =  "start_year",
               label = "Select start of the period",
               choices = 1961:2016
             ),
             selectInput(
               inputId =  "end_year",
               label = "Select end of the period",
               choices = 1961:2016
             ),

             tableOutput("Statistics")
    )

    )
  )
)






