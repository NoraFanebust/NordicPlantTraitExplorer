#' Build the Shiny app server
#'
#' @param input A Shiny input object.
#' @param output A Shiny output object.
#' @param session A Shiny session object.
#'
#' @return No return value. Called for its side effects in a Shiny app.
#' @keywords internal
server <- function(input, output, session) {

  shiny::observe({
    choices <- unique(as.character(data_clean$woodiness))
    choices <- choices[!is.na(choices)]

    shiny::updateCheckboxGroupInput(
      session = session,
      inputId = "woodiness",
      choices = choices,
      selected = choices
    )
  })

  output$x_slider <- shiny::renderUI({
    x_vals <- data_clean[[input$x_trait]]
    x_vals <- x_vals[!is.na(x_vals)]

    shiny::sliderInput(
      inputId = "x_range",
      label = paste("Range for", input$x_trait),
      min = min(x_vals),
      max = max(x_vals),
      value = c(min(x_vals), max(x_vals))
    )
  })

  output$y_slider <- shiny::renderUI({
    y_vals <- data_clean[[input$y_trait]]
    y_vals <- y_vals[!is.na(y_vals)]

    shiny::sliderInput(
      inputId = "y_range",
      label = paste("Range for", input$y_trait),
      min = min(y_vals),
      max = max(y_vals),
      value = c(min(y_vals), max(y_vals))
    )
  })

  filtered_data <- shiny::reactive({
    shiny::req(input$x_trait, input$y_trait, input$x_range, input$y_range, input$woodiness)

    data_clean |>
      dplyr::filter(
        woodiness %in% input$woodiness,
        .data[[input$x_trait]] >= input$x_range[1],
        .data[[input$x_trait]] <= input$x_range[2],
        .data[[input$y_trait]] >= input$y_range[1],
        .data[[input$y_trait]] <= input$y_range[2]
      )
  })

  output$myplot <- ggiraph::renderGirafe({
    df <- filtered_data()

    shiny::validate(
      shiny::need(nrow(df) > 0, "No data left after filtering")
    )

    make_trait_plot(df, input)
  })
}
