library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    # Generate a plot to show the sustainability of the chosen country 
    output$mpgPlot <- renderPlot({
      boxplot(as.formula(formulaText()),
              data = mpgData,
              outline = input$outliers,
              col = "#75AADB", pch = 19)
    
  })
  
})
