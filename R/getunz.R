# download, unzip and read data
#' Title
#'
#' @param zipfile A url string, or a .zip file stored locally.
#'
#' @return A dataframe object from a zipped file.
#' The function create a temp directory, unzip the file, list the available
#' csv files in it and read them.
#' @export
#'
#' @examples
#' \dontrun{
#' getunz("data.zip")
#' }
getunz <- function(zipfile) {
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




