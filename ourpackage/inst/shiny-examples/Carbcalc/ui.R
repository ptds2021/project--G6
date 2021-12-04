library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sustainability"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
       # Input: Selector for countriy information to plot 
       selectInput("country", "Choose a country:",
                   c("Country 1:", data$country,
                     "Country 2:", data$country,
                     "Country 3:", data$country)) # add here vector of country with names
                   
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Sustainibility plot")
    )
  )
))
