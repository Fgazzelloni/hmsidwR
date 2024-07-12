#' Health Metrics Data - Number of Deaths Due to 9 Causes in 6 Locations for the Years 2011 and 2021.
#'
#'
#' @docType data
#' @name deaths9
#' @usage data(deaths9)
#' @format A dataframe with `r dim(deaths9)[1]`  rows and `r dim(deaths9)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{location}{character, France,
#'                            Germany,
#'                            Global,
#'                            Italy,
#'                            UK,
#'                            USA}
#' \item{iso2}{character, country code}
#' \item{sex}{character, female, male, both}
#' \item{age}{character, 5-year age groups from <5 to 85+}
#' \item{cause}{character, Alzheimer's disease and other dementias,
#'                         Breast cancer,
#'                         Chronic obstructive pulmonary disease,
#'                         Colon and rectum cancer,
#'                         Diabetes and kidney diseases,
#'                         Lower respiratory infections,
#'                         Road injuries,
#'                         Stroke,
#'                         Tracheal, bronchus, and lung cancer}
#' \item{year}{integer, years 2011 and 2019}
#' \item{dx}{numeric, deaths number estimation}
#' }
#'
#' @examples
#' data(deaths9)
#' head(deaths9)
#' @source 2021 data from the \href{https://vizhub.healthdata.org/gbd-results/}{IHME} website
"deaths9"
