#' Global Health Observatory (GHO) life tables: WHO Global life table values
#'
#' A dataset containing the Global region life tables from 2000 to 2019.
#'
#' @format A dataframe with `r dim(gho_lifetables)[1]` rows and `r dim(gho_lifetables)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{indicator}{character, Tx - person-years lived above age x,<br>
#'                             ex - expectation of life at age x,<br>
#'                             lx - number of people left alive at age x,<br>
#'                             nLx - person-years lived between ages x and x+n,<br>
#'                             nMx - age-specific death rate between ages x and x+n,<br>
#'                             ndx - number of people dying between ages x and x+n,<br>
#'                             nqx - probability of dying between ages x and x+n}
#' \item{year}{numeric, from 2000 to 2019}
#' \item{age}{character, from <1 to 85+ each 5 years}
#' \item{sex}{character, both, male, female}
#' \item{value}{numeric, value of the tables}
#' }
#'
#' @source {[WHO](https://apps.who.int/gho/data/node.main.LIFECOUNTRY?lang=en)}
"gho_lifetables"
