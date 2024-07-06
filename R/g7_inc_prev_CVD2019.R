#' Dataset: Health Metrics Data - G7 Countries Incidence and Prevalence for CVD and Stroke in 2019
#'
#'
#' Locations available are Global, Canada, France, Germany, Italy, Japan, UK, and US.
#'
#' @format A dataframe with `r dim(g7_inc_prev_CVD2019)[1]` rows and `r dim(g7_inc_prev_CVD2019)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{measure}{character, metric name}
#'   \item{location}{character, country}
#'   \item{sex}{character, Female, Male, Both}
#'   \item{age}{character, age groups from 01 to 85+ each 5 years}
#'   \item{cause}{character, CVD and Stroke}
#'   \item{val}{numeric, estimated values}
#'   \item{upper}{numeric, estimated upper values}
#'   \item{lower}{numeric, estimated lower values}
#' }
#' @source <https://vizhub.healthdata.org/gbd-results/>
"g7_inc_prev_CVD2019"
