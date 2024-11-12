#' Dataset: Health Metrics Data - Disability Weights and Severity in 2019 and 2021
#'
#' A dataset containing the Disability Weights estimates, upper and lower values,
#' and the Severity level for Stroke, Tuberculosis, and HIV for all countries.
#'
#' @format A dataframe with `r dim(disweights)[1]` rows and `r dim(disweights)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{sequela}{character, disease sequela}
#' \item{specification}{character, diesase specification}
#' \item{cause1}{character, first cause of disease - morbidity}
#' \item{cause2}{character, second cause of disease - morbidity}
#' \item{severity}{character, mild,
#'                            moderate,
#'                            severe,
#'                            mean}
#' \item{dw}{numeric, disability weights estimation}
#' \item{upper}{numeric, upper value estimation}
#' \item{lower}{numeric, lower value estimation}
#' }
#'
#' @source {Global Burden of Disease Collaborative Network. Global Burden of Disease Study 2019 and 2021 Disability Weights. Seattle, United States of America: Institute for Health Metrics and Evaluation (IHME), 2024.}
"disweights"
