#' @title Launch shiny app
#' @description Function to start the shiny app once the package is loaded
#' @return shiny app UI
#' @export
#' @examples
#' run_shiny()

source("../Sustshinability")

run_shiny <- function(){

  runApp('inst/shiny-examples/Sustshinability')
  shinyApp(ui = ui, server = server)

}
