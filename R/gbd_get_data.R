# Function to fetch data from the GBD API
#' Title: gbd_get_data - Fetch Data from GBD API
#'
#' @description This function fetches data from the GBD API. To use this function, you need to have an API key. You can get the key by registering on the [IHME-API](https://ghdx.healthdata.org/ihme-api) website.
#'
#' @param url The base URL of the API.
#' @param key The API key for authorization.
#' @param endpoint The specific endpoint to retrieve data from.
#' @param ... Additional query parameters such as location_id, year, etc.
#'
#' @return A data frame or list of results from the API.
#' @export
#' @examples
#' \dontrun{
#' # This is a dontrun example because it requires an API KEY.
#' url <- "https://api.healthdata.org/sdg/v1"
#' key <- "YOUR-KEY"
#' endpoint <- "GetResultsByIndicator"
#'
#' data <- gbd_get_data(url,
#'                     key,
#'                     endpoint,
#'                     indicator_id="1001",
#'                     location_id= c("29","86","102"),
#'                     year="2019",
#'                     limit = 10)
#' }
#'
gbd_get_data <- function(url, key, endpoint, ...) {
  # Capture additional parameters passed via `...`
  query_params <- list(...)

  # Call the private helper function to fetch the data
  return(fetch_data(url, key, endpoint, query_params))
}
