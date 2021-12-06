library(shiny)
library(G6)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Generate a plot to show the sustainability of the chosen country
    output$`Sustainibility plot` <- renderPlot({
      sustainability(input$country)
  })

})
