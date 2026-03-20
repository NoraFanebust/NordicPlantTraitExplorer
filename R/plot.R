ggplot_girafe_server <- function(filtered_data, input) {
  renderGirafe({
    df <- filtered_data()

    validate(
      need(nrow(df) > 0, "No data left after filtering")
    )

    x_var <- input$x_trait
    y_var <- input$y_trait

    model <- lm(df[[y_var]] ~ df[[x_var]])
    intercept <- coef(model)[1]
    slope <- coef(model)[2]

    eq_label <- paste0(
      "y = ",
      round(slope, 3), "x + ",
      round(intercept, 3)
    )

    p <- ggplot(df, aes(
      x = .data[[x_var]],
      y = .data[[y_var]],
      col = species
    )) +
      geom_point_interactive(
        aes(
          tooltip = paste0(
            species,
            "<br>", trait_labels[input$x_trait], ": ", round(.data[[x_var]], 3),
            "<br>", trait_labels[input$y_trait], ": ", round(.data[[y_var]], 3)
          )
        ),
        size = 3,
        alpha = 0.8
      ) +
      theme_classic() +
      labs(
        x = if (input$log_xy)
          bquote(log[10](.(trait_labels[input$x_trait])))
        else trait_labels[input$x_trait],
        y = if (input$log_xy)
          bquote(log[10](.(trait_labels[input$y_trait])))
        else trait_labels[input$y_trait],
        color = trait_labels[input$x_trait]
      ) +
      theme(legend.position = "none")

    if (isTRUE(input$trend_line)) {
      p <- p +
        geom_smooth_interactive(
          aes(tooltip = eq_label),
          method = "lm",
          se = FALSE
        )
    }

    if (isTRUE(input$log_xy)) {
      p <- p +
        scale_x_log10() +
        scale_y_log10()
    }

    girafe(
      ggobj = p,
      options = list(
        opts_tooltip(opacity = 0.9),
        opts_hover(css = "stroke-width:3;")
      )
    )
  })
}
