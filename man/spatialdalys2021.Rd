% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatialdalys2021.R
\docType{data}
\name{spatialdalys2021}
\alias{spatialdalys2021}
\title{Health Metrics Data - Disability-Adjusted Life Years (DALYs) Estimations for 204 countries in 2021 with spatial information.}
\format{
A dataframe with 92862  rows and 7 variables:

The variables are as follows:

\describe{
\item{location}{character, France,
Germany,
Global,
Italy,
UK,
USA,
...}
\item{value}{double, DALYs number estimation}
\item{lower_bound}{double, DALYs number estimation lower bound}
\item{upper_bound}{double, DALYs number estimation upper bound}
\item{long}{double, longitude}
\item{lat}{double, latitude}
\item{group}{double, polygons' group}
}
}
\source{
2021 data from the \href{https://vizhub.healthdata.org/gbd-results/}{IHME} website
}
\usage{
data(spatialdalys2021)
}
\description{
Health Metrics Data - Disability-Adjusted Life Years (DALYs) Estimations for 204 countries in 2021 with spatial information.
}
\examples{
data(spatialdalys2021)
head(spatialdalys2021)
}
\keyword{datasets}
