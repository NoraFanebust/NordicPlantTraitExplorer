data_raw <- readr::read_csv("data-raw/NordicTraits_wide_V1.csv")

data_clean <- data_raw |>
  dplyr::select(
    species,
    seed_mass,
    SLA,
    leaf_CN_ratio,
    leaf_N,
    height,
    leaf_area,
    rooting_depth,
    LDMC,
    woodiness
  )

usethis::use_data(data_clean, overwrite = TRUE)
