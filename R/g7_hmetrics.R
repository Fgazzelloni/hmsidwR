#' Dataset: Health Metrics Data - G7 Countries
#'
#' A subset of data from the IHME GBD on Deaths, DALYs, YLLs, YLDs, Incidence and Prevalence, age standardized for all causes and respiratory infections and tuberculosis.
#' For years 2010, 2019 and 2021.
#'
#' Locations available are Global, Canada, France, Germany, Italy, Japan, UK, and US.
#'
#' @format A dataframe with `r dim(g7_hmetrics)[1]` rows and `r dim(g7_hmetrics)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{measure}{character, metric name}
#'   \item{location}{character, country}
#'   \item{sex}{character, Female, Male, Both}
#'   \item{cause}{character, all causes, and respiratory infections and tuberculosis}
#'   \item{year}{integer, year}
#'   \item{val}{numeric, estimated values}
#'   \item{upper}{numeric, estimated upper values}
#'   \item{lower}{numeric, estimated lower values}
#' }
#' @source <https://vizhub.healthdata.org/gbd-results/>
"g7_hmetrics"
