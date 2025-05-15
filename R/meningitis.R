#' Dataset: Health Metrics Data - Meningitis
#'
#' Data include the number of deaths due to meningitis, as well as levels of two risk factors, particulate matter (PM2.5) and smoking.
#'
#' For years from 1990 to 2021.
#'
#' Locations available are Central African Republic, Zambia, Eswatini, Lesotho, and Malawi.
#'
#' @format A dataframe with `r dim(meningitis)[1]` rows and `r dim(meningitis)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{year}{character, metric name}
#'   \item{location}{character, country}
#'   \item{deaths}{numeric, Rates}
#'   \item{dalys}{numeric, Rates}
#'   \item{smoking}{numeric, Rates}
#'   \item{pm25}{numeric, Rates}
#' }
#' @source <https://vizhub.healthdata.org/gbd-results/>
"meningitis"
