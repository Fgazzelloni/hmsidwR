#' Health Metrics Data - Disability-Adjusted Life Years (DALYs) Estimations for 204 countries in 2021 with spatial information.
#'
#' @docType data
#' @name spatialdalys2021
#' @usage data(spatialdalys2021)
#' @format A dataframe with `r dim(spatialdalys2021)[1]`  rows and `r dim(spatialdalys2021)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{location}{character, France,
#'                            Germany,
#'                            Global,
#'                            Italy,
#'                            UK,
#'                            USA,
#'                            ...}
#' \item{value}{double, DALYs number estimation}
#' \item{lower_bound}{double, DALYs number estimation lower bound}
#' \item{upper_bound}{double, DALYs number estimation upper bound}
#' \item{long}{double, longitude}
#' \item{lat}{double, latitude}
#' \item{group}{double, polygons' group}
#' }
#'
#' @examples
#' data(spatialdalys2021)
#' head(spatialdalys2021)
#' @source 2021 data from the \href{https://vizhub.healthdata.org/gbd-results/}{IHME} website
"spatialdalys2021"
