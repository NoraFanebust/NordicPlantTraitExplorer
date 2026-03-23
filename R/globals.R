#' Chosen trait variables for the app
#'
#' Returns the column names that can be selected for the x- and y-axes.
#'
#' @return A character vector of trait variable names.
#' @keywords internal
trait_choices <- function() {
  c(
    "seed_mass",
    "SLA",
    "leaf_CN_ratio",
    "leaf_N",
    "height",
    "leaf_area",
    "rooting_depth",
    "LDMC"
  )
}

#' Trait labels with units
#'
#' @return A named character vector of trait labels.
#' @keywords internal
trait_labels <- function() {
  c(
    seed_mass = "Seed mass (mg)",
    SLA = "Specific leaf area (mm²/mg)",
    leaf_CN_ratio = "Leaf C:N ratio",
    leaf_N = "Leaf nitrogen (mg/g)",
    height = "Plant height (cm)",
    leaf_area = "Leaf area (mm²)",
    rooting_depth = "Rooting depth (m)",
    LDMC = "Leaf dry matter content (g/g)"
  )
}
