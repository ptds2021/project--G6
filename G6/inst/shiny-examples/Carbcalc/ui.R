library(shiny)
library(Carbcalc)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sustainability"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
       # Input: Selector for countriy information to plot 
       selectInput("country", "Choose a country:",
                   c(unique(data$country)),
                   multiple = TRUE) # add here vector of country with names
                   
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Sustainibility plot")
    )
  )
))
