library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sustshinability"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      
      # Input: Selector for country information to plot 
      selectInput("country", "Choose a country:",
                  c(unique(data$country)),
                  multiple = TRUE)), # add here vector of country with names
      
      # Input: Selector for country information to plot 
      selectInput("country", "Choose a country:",
                  c(unique(data$country)),
                  multiple = TRUE)), # add here vector of country with names
    
      selectInput("indicator", "Choose a category:",
                  c("crop_land",
                    "grazing_land",
                    "forest_land",
                    "fishing_ground",
                    "built_up_land",
                    "carbon",
                    "total"),
                  multiple = FALSE)),
  
    selectInput("record_chosen", "Choose a record:",
                c("AreaPerCap",
                  "AreaTotHA",
                  "BiocapPerCap",
                  "BiocapTotGHA",
                  "EFConsPerCap",
                  "EFConsTotGHA",
                  "EFProdPerCap",
                  "EFProdTotGHA"),
                multiple = FALSE))
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Sustainibility plot"))
   )
  )
 )
)

