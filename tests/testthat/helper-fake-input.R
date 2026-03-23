fake_input <- function(
    x_trait = "leaf_N",
    y_trait = "SLA",
    log_xy = FALSE,
    trend_line = FALSE
) {
  list(
    x_trait = x_trait,
    y_trait = y_trait,
    log_xy = log_xy,
    trend_line = trend_line
  )
}
