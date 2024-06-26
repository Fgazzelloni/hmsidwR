#' Health Metrics - Number of Deaths Due to 9 Causes in 2019
#'
#' A dataset containing the number of deaths due to 9 causes in 6 regions for 2019.
#'
#' @format A dataframe with `r dim(deaths2019)[1]` rows and `r dim(deaths2019)[2]` variables:
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
#' \item{age}{character, age groups from 10-14 to 85+ each 5 years}
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
#' @source {2019 data from the [IHME](https://vizhub.healthdata.org/gbd-results/) website}
"deaths2019"
