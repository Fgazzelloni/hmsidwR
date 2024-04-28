#' Germany lungcancer deaths 2019
#'
#' A dataset containing deaths number due to lungcancer in Germany 2019.
#'
#' @format A dataframe with `r dim(germany_lungc)[1]` rows and `r dim(germany_lungc)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{age}{character, age groups from 10-14 to 85+ each 5 years}
#' \item{sex}{character, both, male, female}
#' \item{prevalence}{numeric, prevalence rate estimation due to lungcancer}
#' \item{prev_upper}{numeric, upper value estimation}
#' \item{prev_lower}{numeric, lower value estimation}
#' \item{dx}{numeric, deaths rate estimation due to lungcancer}
#' \item{dx_upper}{numeric, upper value estimation}
#' \item{dx_lower}{numeric, lower value estimation}
#' }
#'
#' @source {2019 data from the [IHME](https://vizhub.healthdata.org/gbd-results/) website}
"germany_lungc"
