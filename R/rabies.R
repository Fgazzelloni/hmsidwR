#' Health Data from the Institute of Health Metrics and Evaluations (IHME)
#'
#' A subset of data from the IHME GBD on Deaths All Causes and due to Rabies,
#' it also provides the DALYs estimated values.
#' Locations available are Global and Asia.
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
