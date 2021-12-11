library(shiny)
library(G6)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  thematic::thematic_shiny()

  # Generate a plot to show the sustainability of the chosen country
  output$`Sustainibility plot` <- renderPlot({
    sustainability(input$country)
  })

  output$`Map Overview` <- renderPlot({
    map_overview(input$record)
  })
  
  output$timeseries <- renderPlot({
    carb_countries_ts(input$country, input$record, input$indicator, input$doforecast, input$yearforecast)
  })
  

})
