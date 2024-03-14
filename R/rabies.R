#' Health Data from the Institute of Health Metrics and Evaluations (IHME)
#'
#' A subset of data from the IHME GBD on Deaths All Causes and due to Rabies,
#' it also provides the DALYs estimated values.
#' Locations available are Global and Asia.
#'
#' @format ## `rabies`
#' A data frame with 240 rows and 7 columns:
#' \describe{
#'   \item{measure}{character, metric name}
#'   \item{location}{character, country}
#'   \item{cause}{character, cause}
#'   \item{year}{integer, year}
#'   \item{val}{numeric, estimated values}
#'   \item{upper}{numeric, estimated upper values}
#'   \item{lower}{numeric, estimated lower values}
#'   ...
#' }
#' @source <healthdata.org>
"rabies"
