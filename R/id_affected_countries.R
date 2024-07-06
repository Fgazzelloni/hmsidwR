#' Dataset: Health Metrics Data - Infectious Diseases 1980-2021
#'
#' A dataset containing average values for deaths rates, dalys, ylls, ylds due to 37 infectious diseases form 1980 to 2012 for all countries.
#'
#' @format A dataframe with `r dim(id_affected_countries)[1]` rows and `r dim(id_affected_countries)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{location_name}{character, list of countries}
#' \item{year}{numeric, from 1980 to 2021}
#' \item{DALYs}{numeric, DALYs for 100 000}
#' \item{YLLs}{numeric, YLLs for 100 000}
#' \item{YLDs}{numeric, YLDs for 100 000}
#' \item{Deaths}{numeric, deaths rate}
#' }
#'
#' @source {[IHME](https://vizhub.healthdata.org/gbd-results/) website}
"id_affected_countries"
