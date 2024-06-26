% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getunz.R
\name{getunz}
\alias{getunz}
\title{Download, Unzip and Read Data: getunz}
\usage{
getunz(url)
}
\arguments{
\item{url}{A url string for a .zip file.}
}
\value{
A dataframe object from a zipped file.
The function takes the url, creates a temp directory,
unzip the file, lists the available csv files, if more than one and reads them.

Select a dataset from the IHME GBD results and download it.
You will receive an email with a url.
Use the url to download the data.
}
\description{
Download, Unzip and Read Data: getunz
}
\examples{
\dontrun{
url <- "https://www.healthdata.org/.../some-file.zip"
getunz(url)
}
}
