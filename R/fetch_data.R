#' Helper function to fetch data from API
#'
#' This is an internal function used to fetch data from the specified API.
#' It is not exported and should not be called directly by users.
#'
#' @keywords internal
#' @import httr
#' @importFrom jsonlite fromJSON
fetch_data <- function(url, key, endpoint, query_params) {
  # Convert vector inputs to repeated parameters in the query string
  query_string <- unlist(lapply(names(query_params), function(name) {
    param <- query_params[[name]]
    if (is.vector(param)) {
      # Repeat the parameter for each value in the vector
      paste0(name, "=", param)
    } else {
      paste0(name, "=", param)
    }
  }))

  # Construct dynamic endpoint by joining query parameters with '&'
  dynamic_endpoint <- paste0(endpoint, "?", paste(query_string, collapse = "&"))

  # Combine base URL and dynamic endpoint
  full_url <- paste0(url, "/", dynamic_endpoint)

  # Make the GET request with the Authorization header
  res <- httr::GET(full_url, add_headers(Authorization = key))

  # Check if the request was successful
  if (httr::status_code(res) == 200) {
    # Parse JSON content
    data <- jsonlite::fromJSON(rawToChar(res$content))

    # Extract the results if present
    if ("results" %in% names(data)) {
      return(data$results)
    } else {
      return(data)
    }
  } else {
    stop("Failed to fetch data. Status code: ", status_code(res))
  }
}
