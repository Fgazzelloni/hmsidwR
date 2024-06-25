
# hmsidwR - Health Metrics and the Spread of Infectious Diseases with R

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/768163778.svg)](https://zenodo.org/badge/latestdoi/768163778)
[![R-CMD-check](https://github.com/Fgazzelloni/hmsidwR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Fgazzelloni/hmsidwR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{hmsidwR}` is to provide the set of data used in the
**Health Metrics and the Spread of Infectious Diseases Machine Learning
Applications and Spatial Modeling Analysis with R** book.

## Installation

You can install the development version of hmsidwR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Fgazzelloni/hmsidwR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(hmsidwR)
library(dplyr)
data(sdi90_19)
head(subset(sdi90_19, location == "Global"))
#> # A tibble: 6 × 3
#>   location  year value
#>   <chr>    <dbl> <dbl>
#> 1 Global    1990 0.511
#> 2 Global    1991 0.516
#> 3 Global    1992 0.521
#> 4 Global    1993 0.525
#> 5 Global    1994 0.529
#> 6 Global    1995 0.534
```

``` r
sdi_avg <- sdi90_19 |>
  group_by(location) |>
  reframe(sdi_avg = round(mean(value), 3))

head(sdi_avg)
#> # A tibble: 6 × 2
#>   location       sdi_avg
#>   <chr>            <dbl>
#> 1 Aceh             0.58 
#> 2 Acre             0.465
#> 3 Afghanistan      0.238
#> 4 Aguascalientes   0.606
#> 5 Aichi            0.846
#> 6 Akita            0.792
```

``` r
sdi90_19 |>
  filter(location %in% c("Global", "Italy", "France", "Germany")) |>
  group_by(location) |>
  reframe(sdi_avg = round(mean(value), 3)) |>
  head()
#> # A tibble: 4 × 2
#>   location sdi_avg
#>   <chr>      <dbl>
#> 1 France     0.79 
#> 2 Germany    0.863
#> 3 Global     0.58 
#> 4 Italy      0.763
```
