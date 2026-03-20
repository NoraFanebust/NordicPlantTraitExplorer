ui <- function() {
  page_sidebar(
    title = "Titel",
    h1("overskrift?"),
    p("si noe om graf..."),
    sidebar = sidebar(
      selectInput(
        inputId = "x_trait",
        label = "X-axis trait:",
        choices = trait_choices,
        selected = "seed_mass"
      ),
      uiOutput("x_slider"),
      selectInput(
        inputId = "y_trait",
        label = "Y-axis trait:",
        choices = trait_choices,
        selected = "SLA"
      ),
      uiOutput("y_slider"),
      checkboxGroupInput(
        inputId = "woodiness",
        label = "Woodiness",
        choices = woodiness_choices(),
        selected = woodiness_choices()
      ),
      checkboxInput(
        inputId = "log_xy",
        label = "Log-transform values",
        value = FALSE
      ),
      checkboxInput("trend_line", "Show trend line", FALSE)
    ),
    card(girafeOutput("myplot", height = "600px"))
  )
}
