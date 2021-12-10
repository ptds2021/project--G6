library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  theme = bslib::bs_theme(bootswatch = "darkly"),
  
  # Application title
  titlePanel("Sustshinability"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      
      # Input: Selector for country information to plot 
      selectInput("country", "Choose a country:",
                  c(unique(data$country)),
                  multiple = TRUE)), # add here vector of country with names
      
      
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Sustainibility plot"))
  )
 )
)


