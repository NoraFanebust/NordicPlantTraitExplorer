test_that("make_trait_plot returns a girafe object", {
  df <- data_clean[stats::complete.cases(data_clean[, c("leaf_N", "SLA")]), ]
  df <- df[1:min(20, nrow(df)), ]

  plot_obj <- make_trait_plot(
    df = df,
    input = fake_input(
      x_trait = "leaf_N",
      y_trait = "SLA",
      log_xy = FALSE,
      trend_line = FALSE
    )
  )

  expect_s3_class(plot_obj, "girafe")
})

test_that("make_trait_plot works with trend line enabled", {
  df <- data_clean[stats::complete.cases(data_clean[, c("leaf_N", "SLA")]), ]
  df <- df[1:min(20, nrow(df)), ]

  plot_obj <- make_trait_plot(
    df = df,
    input = fake_input(
      x_trait = "leaf_N",
      y_trait = "SLA",
      log_xy = FALSE,
      trend_line = TRUE
    )
  )

  expect_s3_class(plot_obj, "girafe")
})

test_that("make_trait_plot works with log-transformed values", {
  df <- data_clean[stats::complete.cases(data_clean[, c("leaf_N", "SLA")]), ]
  df <- df[1:min(20, nrow(df)), ]

  plot_obj <- make_trait_plot(
    df = df,
    input = fake_input(
      x_trait = "leaf_N",
      y_trait = "SLA",
      log_xy = TRUE,
      trend_line = FALSE
    )
  )

  expect_s3_class(plot_obj, "girafe")
})

test_that("make_trait_plot works with both log transform and trend line", {
  df <- data_clean[stats::complete.cases(data_clean[, c("leaf_N", "SLA")]), ]
  df <- df[1:min(20, nrow(df)), ]

  plot_obj <- make_trait_plot(
    df = df,
    input = fake_input(
      x_trait = "leaf_N",
      y_trait = "SLA",
      log_xy = TRUE,
      trend_line = TRUE
    )
  )

  expect_s3_class(plot_obj, "girafe")
})
