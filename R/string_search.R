#' Scan all folders and files to find a string: string_search
#'
#' @param path If NULL, the current directory is used
#' @param pattern A regular expression pattern such as '\\.R$'
#' @param string A string such as 'metric'
#'
#' @return A character vector with the names of the files that contain the string
#' @export
#'
#' @examples
#' string_search(path=".","\\.R$","metric")
#'
#' # function string_search
string_search <- function(path = ".", pattern, string) {
  # List all files matching the pattern in the specified path
  fileNames <- list.files(path = path,
                          pattern = pattern,
                          recursive = TRUE,
                          full.names = TRUE)

  # Function to check if a file contains the specific string
  contains_string <- function(file) {
    lines <- readLines(file, warn = FALSE)
    any(grepl(string, lines, ignore.case = TRUE))
  }

  # Check for errors in sapply call
  result <- tryCatch({
    files_with_string <- fileNames[sapply(fileNames, contains_string)]
    return(files_with_string)
  }, error = function(e) {
    stop("An error occurred: Please provide corrected path.")
  })

  return(result)
}
