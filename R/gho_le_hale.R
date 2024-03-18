#' Global Health Observatory (GHO) - Countries Life Expectancy and HALE 2000-2019
#'
#' A dataset containing World countries Life Expectancy and HALE from 2000 to 2019.
#'
#' @format A dataframe with `r dim(gho_le_hale)[1]` rows and `r dim(gho_le_hale)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{indicator}{character, Healthy life expectancy (HALE) at age 60 (years),<br>
#'                             Healthy life expectancy (HALE) at birth (years),<br>
#'                             Life expectancy at age 60 (years),<br>
#'                             Life expectancy at birth (years)}
#' \item{year}{numeric, from 2000 to 2019}
#' \item{region}{character, 6 World regions: Africa, Americas, Eastern Mediterranean, Europe, South-East Asia, and Western Pacific}
#' \item{country}{character, 183 World countries}
#' \item{sex}{character, both, male, female}
#' \item{value}{numeric, value of the indicator}
#' }
#'
#' @source {[WHO](https://apps.who.int/gho/data/node.main.SDG2016LEX?lang=en)}
"gho_le_hale"
