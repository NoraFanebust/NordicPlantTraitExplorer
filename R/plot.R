#' Build the interactive ggiraph scatterplot for the chosen plant trait data.
#'
#' @param df filtered data frame used for plotting.
#' @param input A shiny input object or input-like list wiht
#'   \code{x_trait}, \code{y_trait}, \code{log_xy}, and \code{trend_line}.
#'
#' @return A ggiraph widget.
#' @keywords internal
make_trait_plot <- function(df, input) {
  x_var <- input$x_trait
  y_var <- input$y_trait
  labels <- trait_labels()

  if (isTRUE(input$log_xy)) {
    df <- df |>
      dplyr::mutate(
        plot_x = log10(.data[[x_var]]),
        plot_y = log10(.data[[y_var]])
      )

    x_lab <- paste0("log10(", labels[x_var], ")")
    y_lab <- paste0("log10(", labels[y_var], ")")
  } else {
    df <- df |>
      dplyr::mutate(
        plot_x = .data[[x_var]],
        plot_y = .data[[y_var]]
      )

    x_lab <- labels[x_var]
    y_lab <- labels[y_var]
  }

  model <- stats::lm(plot_y ~ plot_x, data = df)
  intercept <- stats::coef(model)[1]
  slope <- stats::coef(model)[2]

  eq_label <- paste0(
    "y = ",
    round(slope, 3), "x + ",
    round(intercept, 3)
  )

  p <- ggplot2::ggplot(df, ggplot2::aes(
    x = plot_x,
    y = plot_y,
    col = species
  )) +
    ggiraph::geom_point_interactive(
      ggplot2::aes(
        tooltip = paste0(
          species,
          "<br>", labels[x_var], ": ", round(.data[[x_var]], 3),
          "<br>", labels[y_var], ": ", round(.data[[y_var]], 3)
        )
      ),
      size = 1.5,
      alpha = 0.5
    ) +
    ggplot2::scale_color_viridis_d() +
    ggplot2::theme_classic() +
    ggplot2::labs(
      x = x_lab,
      y = y_lab,
      color = labels[x_var]
    ) +
    ggplot2::theme(legend.position = "none")

  if (isTRUE(input$trend_line)) {
    p <- p +
      ggiraph::geom_smooth_interactive(
        ggplot2::aes(tooltip = eq_label),
        method = "lm",
        color = "#1b3427",
        se = FALSE
      )
  }

  ggiraph::girafe(
    ggobj = p,
    options = list(
      ggiraph::opts_tooltip(opacity = 0.9),
      ggiraph::opts_hover(css = "stroke-width:3;")
    )
  )
}
