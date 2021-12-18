#' @title Launch shiny app
#' @description Function to start the shiny app once the package is loaded
#' @return shiny app UI
#' @export
#' @examples
#' run_shiny()

#source("server.R")
#file.path(getwd(), "Graphics", "graph1.R")

run_shiny <- function(){

  runApp('inst/shiny-examples/Sustshinability/server.R')
  #shinyApp(ui = ui, server = server)

}

