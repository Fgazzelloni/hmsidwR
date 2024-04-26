#' Health Metrics - Disability Weights and Severity in 2019
#'
#' A dataset containing the disability weights estimates, upper and lower values,
#' and the severity level for Stroke, Tuberculosis, and HIV for 2019.
#'
#' @format A dataframe with `r dim(disweights2019)[1]` rows and `r dim(disweights2019)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{specification}{character, diesase specification}
#' \item{cause1}{character, first cause of disease}
#' \item{cause2}{character, second cause of disease}
#' \item{severity}{character, mild,
#'                            moderate,
#'                            severe}
#' \item{disability_weight}{numeric, disability weight estimation}
#' \item{upper}{numeric, upper value estimation}
#' \item{lower}{numeric, lower value estimation}
#' }
#'
#' @source {2019 data from the [IHME](https://vizhub.healthdata.org/gbd-results/) website}
"disweights2019"
