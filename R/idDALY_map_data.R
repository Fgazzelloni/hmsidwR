#' Dataset: Health Metrics Data - Simple Feature Collection
#' Average Disability-Adjusted Life Years (DALYs) per 100,000 population from 1990 to 2021
#'
#' @format A Simple feature collection with `r dim(idDALY_map_data)[1]` rows and `r dim(idDALY_map_data)[2]` variables:
#'
#' \describe{
#' \item{group}{double, country's polygon}
#' \item{location_name}{character, 200 Countries affected by Infectious Diseases}
#' \item{DALYs}{double, Average DALYs per 100,000 population from 1990 to 2021}
#' \item{geometry}{POLYGON}
#' }
#'
#'
#' @source {2021 data from the [IHME](https://vizhub.healthdata.org/gbd-results/) website}
"idDALY_map_data"
