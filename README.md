
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NordicPlantTraitExplorer

`NordicPlantTraitExplorer` is an R package that provides an interactive
Shiny app for exploring the relationships between plant functional
traits in Nordic plant species.

## Run the app

After installing the package:

1.  Load the package
2.  Run the app function

``` r
library(NordicPlantTraitExplorer)
run_app()
```

## Features

- Select traits for x and y axes
- Filter trait ranges using sliders
- Filter species by woodiness (growth form)
- Optional log10 transformation of values
- Optional linear trend line
- Interactive scatterplot with hover tooltips

## Installation

You can install the package from GitHub using:

``` r
# install.packages("pak")
pak::pak("NoraFanebust/NordicPlantTraitExplorer")
```
