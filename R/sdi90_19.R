#' Socio-Demographic Index (SDI) for 1990 and 2019
#'
#' A subset of data from the IHME GBD containing location, year and
#' estimated values of the SDI for the years 1990 and 2019.
#'
#' @format A dataframe with `r dim(sdi90_19)[1]` rows and `r dim(sdi90_19)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{location}{character, country}
#'   \item{year}{integer, year}
#'   \item{val}{numeric, estimated values}
#' }
#' @source <healthdata.org>
"sdi90_19"
