#' Dataset: Health Metrics Data - Number of Deaths Due to 9 Causes in 2019
#'
#' A dataset containing the number of Deaths due to 9 causes in 6 regions for 2019.
#'
#' @docType data
#' @name deaths2019
#' @usage data(deaths2019)
#' @format A dataframe with 2754 rows and 7 variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{location}{character, France,
#'                            Germany,
#'                            Global,
#'                            Italy,
#'                            United Kingdom,
#'                            United States of America}
#' \item{sex}{character, Female, Male, Both}
#' \item{age}{character, age groups from <1 to 85+ each 5 years}
#' \item{cause}{character, Alzheimer's disease and other dementias,
#'                         Breast cancer,
#'                         Chronic obstructive pulmonary disease,
#'                         Colon and rectum cancer,
#'                         Diabetes and kidney diseases,
#'                         Lower respiratory infections,
#'                         Road injuries,
#'                         Stroke,
#'                         Tracheal, bronchus, and lung cancer}
#' \item{val}{numeric, deaths number estimation}
#' \item{upper}{numeric, upper value estimation}
#' \item{lower}{numeric, lower value estimation}
#' }
#'
#' @examples
#' data(deaths2019)
#' head(deaths2019)
#' @source 2019 data from the \href{https://vizhub.healthdata.org/gbd-results/}{IHME} website
"deaths2019"
