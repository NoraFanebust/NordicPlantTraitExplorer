test_that("data_clean has correct columns", {
  expect_named(
    data_clean,
    c(
      "species",
      "seed_mass",
      "SLA",
      "leaf_CN_ratio",
      "leaf_N",
      "height",
      "leaf_area",
      "rooting_depth",
      "LDMC",
      "woodiness"
    )
  )
})

test_that("traits are numeric", {
  trait_cols <- c(
    "seed_mass",
    "SLA",
    "leaf_CN_ratio",
    "leaf_N",
    "height",
    "leaf_area",
    "rooting_depth",
    "LDMC"
  )

  expect_true(all(vapply(data_clean[trait_cols], is.numeric, logical(1))))
})
