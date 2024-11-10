#' Dataset: Health Metrics Data - Rabies Deaths and DALYs from 1980 to 2021
#'
#' A subset of data from the IHME GBD on DALYs and Deaths due to All Causes and Rabies. Locations available are Global Region and Asia.
#'
#' @format A dataframe with `r dim(rabies)[1]` rows and `r dim(rabies)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{measure}{character, metric name}
#'   \item{location}{character, country}
#'   \item{cause}{character, cause}
#'   \item{year}{integer, year}
#'   \item{val}{numeric, estimated values}
#'   \item{upper}{numeric, estimated upper values}
#'   \item{lower}{numeric, estimated lower values}
#' }
#' @source <https://www.healthdata.org/>
"rabies"
