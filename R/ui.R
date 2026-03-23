#' Creates the user interface for the plant trait explorer shiny app.
#'
#' @return A Shiny UI definition.
#' @keywords internal
ui <- function() {
  bslib::page_sidebar(
    title = "Nordic Plant Trait Explorer",
    shiny::div(
      style = "font-size: 13px;
    line-height: 1.2;",
      shiny::p("Explore relationships between plant traits across Nordic plant species.
Select traits, filter their ranges, and hover over points to see species-level values. Traits represent key ecological strategies:"),
      shiny::p("- Reproduction: seed mass"),
      shiny::p("- Leaf economics: SLA, LDMC, leaf nitrogen, leaf C:N ratio"),
      shiny::p("- Size and resource use: height, leaf area, rooting depth"),
      shiny::p("- Growth form: woodiness (woody vs non-woody)"),
      shiny::p("Note: Colours are for visual distinction only and do not represent any variable.")
    ),
    sidebar = bslib::sidebar(
      shiny::selectInput(
        inputId = "x_trait",
        label = "X-axis trait:",
        choices = trait_choices(),
        selected = "leaf_N"
      ),
      shiny::uiOutput("x_slider"),
      shiny::selectInput(
        inputId = "y_trait",
        label = "Y-axis trait:",
        choices = trait_choices(),
        selected = "SLA"
      ),
      shiny::uiOutput("y_slider"),
      shiny::checkboxGroupInput(
        inputId = "woodiness",
        label = "Woodiness",
        choices = NULL
      ),
      shiny::checkboxInput(
        inputId = "log_xy",
        label = "Log-transform values",
        value = FALSE
      ),
      shiny::checkboxInput("trend_line", "Show trend line", FALSE)
    ),
    bslib::card(ggiraph::girafeOutput("myplot"))
  )
}
