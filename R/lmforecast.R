#' lmforecast function
#'
#' @param x A numeric vector, identifying the covariate of the model
#' @param a A numeric vector, The intercept
#' @param m A numeric vector, The slope, or the betas estimated values
#' @param e A numeric vector, The error
#'
#' @return A dataframe containing the vector with the estimation, and the original data
#' @export
#'
#' @examples
#' x <- rnorm(n = 50, mean = 0, sd = 1)
#' lmforecast(
#' x = x,
#' a = 0.1,
#' m = dunif(x, min = 0.02, max = 1),
#' e = rnorm(length(x), mean = 0, sd = 1))
lmforecast <- function(x, a, m, e) {
  stopifnot(is.numeric(x), length(x) >= 1)
  pred <- a + m * x + e
  data.frame(pred, x, error = e)
}
