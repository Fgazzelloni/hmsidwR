#' Global Region Health Metrics Data - Incidence and Prevalence for Stroke 2019 and 2021
#' Numbers - 5-year age groups from <1 to 85+ and both
#' Location available Global
#'
#' @format A dataframe with `r dim(incprev_stroke1921)[1]` rows and `r dim(incprev_stroke1921)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#'   \item{measure}{character, metric name}
#'   \item{sex}{character, female, male, both}
#'   \item{age}{character, age groups from <1 to 85+ each 5 years}
#'   \item{year}{integer, years 2019 and 2021}
#'   \item{val}{numeric, estimated values}
#'   \item{upper}{numeric, estimated upper values}
#'   \item{lower}{numeric, estimated lower values}
#' }
#' @source <https://vizhub.healthdata.org/gbd-results/>
"incprev_stroke1921"
