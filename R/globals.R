
trait_choices <- c(
  "seed_mass",
  "SLA",
  "leaf_CN_ratio",
  "leaf_N",
  "height",
  "leaf_area",
  "rooting_depth",
  "LDMC"
)

trait_labels <- c(
  seed_mass = "Seed mass (mg)",
  SLA = "Specific leaf area (mm²/mg)",
  leaf_CN_ratio = "Leaf C:N ratio",
  leaf_N = "Leaf nitrogen (mg/g)",
  height = "Plant height (cm)",
  leaf_area = "Leaf area (mm²)",
  rooting_depth = "Rooting depth (m)",
  LDMC = "Leaf dry matter content (g/g)"
)

woodiness_choices <- function() {
  unique(as.character(data_clean$woodiness))
}
