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
    tabPanel("Plot1",
             selectInput("country", "Choose a country:",
                         c(unique(data$country)),
                         multiple = TRUE),
             plotOutput("Sustainibility plot")),
    tabPanel("panel 2", "Panel two contents"),
    tabPanel("panel 3", "Panel three contents")
    )
  )
)






