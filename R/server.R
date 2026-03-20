server <- function(input, output, session) {

  output$x_slider <- renderUI({
    x_vals <- data_clean[[input$x_trait]]
    x_vals <- x_vals[!is.na(x_vals)]

    sliderInput(
      inputId = "x_range",
      label = paste("Range for", input$x_trait),
      min = min(x_vals),
      max = max(x_vals),
      value = c(min(x_vals), max(x_vals))
    )
  })

  output$y_slider <- renderUI({
    y_vals <- data_clean[[input$y_trait]]
    y_vals <- y_vals[!is.na(y_vals)]

    sliderInput(
      inputId = "y_range",
      label = paste("Range for", input$y_trait),
      min = min(y_vals),
      max = max(y_vals),
      value = c(min(y_vals), max(y_vals))
    )
  })

  filtered_data <- reactive({
    req(input$x_trait, input$y_trait, input$x_range, input$y_range, input$woodiness)

    data_clean |>
      dplyr::filter(
        woodiness %in% input$woodiness,
        .data[[input$x_trait]] >= input$x_range[1],
        .data[[input$x_trait]] <= input$x_range[2],
        .data[[input$y_trait]] >= input$y_range[1],
        .data[[input$y_trait]] <= input$y_range[2]
      )
  })

  output$myplot <- ggplot_girafe_server(filtered_data, input)

}

