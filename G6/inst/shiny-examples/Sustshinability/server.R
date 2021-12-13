library(shiny)
#library(G6)

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

  output$Timeseries <- renderPlot({
    timeseries(input$countries_ts, input$record_ts, input$indicator_ts, input$doforecast, input$yearforecast)
  })

  output$Statistics <- renderTable({
    display_stats(input$countries_st, input$record_st, input$indicator_st, (input$start_year:input$end_year))
  })



})
