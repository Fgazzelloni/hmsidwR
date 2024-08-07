% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/g7_hmetrics.R
\docType{data}
\name{g7_hmetrics}
\alias{g7_hmetrics}
\title{Dataset: Health Metrics Data - G7 Countries}
\format{
A dataframe with 8610 rows and 9 variables:

The variables are as follows:

\describe{
\item{measure}{character, metric name}
\item{location}{character, country}
\item{sex}{character, Female, Male, Both}
\item{cause}{character, all causes, level 2 causes}
\item{year}{integer, year}
\item{val}{numeric, estimated values}
\item{upper}{numeric, estimated upper values}
\item{lower}{numeric, estimated lower values}
}
}
\source{
\url{https://vizhub.healthdata.org/gbd-results/}
}
\usage{
g7_hmetrics
}
\description{
A subset of data from the IHME GBD on Deaths, DALYs, YLLs, YLDs, Incidence and Prevalence, age standardized all Causes and level 2 causes.
For years 2010 and 2019.
}
\details{
Locations available are Global, Canada, France, Germany, Italy, Japan, UK, and US.
}
\keyword{datasets}
