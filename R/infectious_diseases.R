#' Dataset: Health Metrics Data - Infectious Diseases 1980-2021
#'
#' A dataset containing Deaths rates, Disability-Adjusted Life Years (DALYs), Years of Life Lost (YLLs), and Years Lived with Disability (YLDs), Prevalence and Incidence due to Infectious Diseases form 1980 to 2021 for Lesotho, Eswatini, Malawi, Central African Republic, and Zambia.
#'
#' @format A dataframe with `r dim(infectious_diseases)[1]` rows and `r dim(infectious_diseases)[2]` variables:
#'
#' The variables are as follows:
#'
#' \describe{
#' \item{year}{numeric, from 1980 to 2021}
#' \item{location_name}{character, list of countries}
#' \item{location_id}{numeric, list of countries by id}
#' \item{cause_name}{character, type of infectious disease}
#' \item{Deaths}{numeric, deaths rate}
#' \item{DALYs}{numeric, DALYs for 100 000}
#' \item{YLDs}{numeric, YLDs for 100 000}
#' \item{YLLs}{numeric, YLLs for 100 000}
#' \item{Prevalence}{numeric, prevalence rate}
#' \item{Incidence}{numeric, incidence rate}
#' \item{val}{numeric, estimated values}
#' }
#'
#' @source {[IHME](https://vizhub.healthdata.org/gbd-results/) website}
"infectious_diseases"
