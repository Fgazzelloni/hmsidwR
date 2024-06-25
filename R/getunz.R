#' Download, Unzip and Read Data: getunz
#'
#' @param url A url string for a .zip file.
#'
#' @return A dataframe object from a zipped file.
#' The function read the url, create a temp directory,
#' unzip the file, list the available
#' csv files in it and read them.
#' @export
#'
#' @examples
#' Select a dataset from the IHME GBD results and download it. You will receive an email with a url.
#' Use the url to download the data.
#' url <- "https://www.healthdata.org/.../some-file.zip"
#' getunz(url)
#'
getunz <- function(url) {
  url <- url
  temp_dir <- tempdir()
  zip_file <- file.path(temp_dir, "data.zip")
  utils::download.file(url, destfile = zip_file, mode = "wb")
  utils::unzip(zip_file, exdir = temp_dir)
  csv_file <- list.files(temp_dir,
                         pattern = "\\.csv$",
                         full.names = TRUE)
  data <- purrr::map(csv_file,utils::read.csv)
  data
}




