#' Run the plant trait explorer shiny app
#'
#' Launches the interactive app for exploring plant trait relationships.
#'
#' @return A running Shiny application.
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui = ui(),
    server = server
  )
}
