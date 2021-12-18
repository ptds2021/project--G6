#' @title Launch shiny app
#' @description Function to start the shiny app once the package is loaded
#' @return shiny app UI
#' @export
#' @examples
#' launch_app

#source("server.R")
#file.path(getwd(), "Graphics", "graph1.R")

launch_app <- function(){

  runApp('inst/shiny-examples/Sustshinability/server.R')
  #shinyApp(ui = ui, server = server)

}

