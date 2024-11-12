#' Kriging Best Fit: kbfit - Fit variogram models and kriging models to spatial data and select the best model based on the metrics values
#'
#' @param response A character string specifying the response variable
#' @param formula A formula object specifying the model to fit: response ~ predictors
#' @param data A simple feature object containing the variables in the formula
#' @param models A list of characters vector specifying the variogram models to fit
#' @param initial_values A list of named numeric vectors specifying the initial values for the variogram models: psill, range, nugget
#'
#' @return A list with two elements: all_models and best_model
#' @export
#' @importFrom gstat vgm fit.variogram variogram gstat
#' @importFrom tibble tibble
#' @importFrom stats coef
#'
#' @examples
#' # Try different initial values for fitting the variogram models
#' initial_values <- list(
#'   list(psill = 1, range = 100000, nugget = 10),
#'   list(psill = 0.5, range = 50000, nugget = 5),
#'   list(psill = 2, range = 150000, nugget = 15)
#' )
#'
#' # Set some models to fit
#' models <- c("Sph", "Exp", "Gau")
#'
#' # Select Best: Fit variogram models and kriging models
#' result <- kbfit(response = "response",
#'                 formula = response ~ predictor1 + predictor2,
#'                 data = data_sf,
#'                 models = c("Sph", "Exp", "Gau", "Mat"),
#'                 initial_values = initial_values)
#'
#' result$all_models
#' result$best_model
#'
kbfit <- function(response, formula, data,
                  models, initial_values) {

  if (!requireNamespace("gstat", quietly = TRUE)) {
    stop("The 'gstat' package is required but not installed.")
  }
  if (!requireNamespace("tibble", quietly = TRUE)) {
    stop("The 'tibble' package is required but not installed.")
  }

  fit_kriging_models(response, formula, data, models, initial_values)
}

fit_kriging_models <- function(response, formula, data,
                               models, initial_values) {

  # Fit variogram
  v <- gstat::variogram(formula, data = data)

  # Initialize lists to store fitted models and metrics
  fitted_models <- list()
  mse_values <- numeric()
  rmse_values <- numeric()
  mae_values <- numeric()
  r2_values <- numeric()
  aic_values <- numeric()
  bic_values <- numeric()

  # Extract actual values
  actual <- data[[response]]

  # Fit variogram models and kriging models
  for (model in models) {
    for (init in initial_values) {
      # Fit variogram models based on initial values
      vgm_model <- gstat::vgm(psill = init$psill,
                              model = model,
                              range = init$range,
                              nugget = init$nugget)
      fit <- try(gstat::fit.variogram(v,
                                      vgm_model,
                                      fit.method = 7),
                 silent = TRUE)
      if (inherits(fit, "try-error")) next
      if (!is.null(fit)) {
        # Fit kriging model
        k <- gstat::gstat(formula = formula,
                          data = data,
                          model = fit)
        # Predict values
        kpred <- try(stats::predict(k, newdata = data),
                     silent = TRUE)
        if (inherits(kpred, "try-error")) next
        predictions <- kpred$var1.pred
        residuals <- predictions - actual
        # Calculate metrics
        mse <- mean(residuals^2)
        rmse <- sqrt(mse)
        mae <- mean(abs(residuals))
        r2 <- 1 - (sum(residuals^2) / sum((actual - mean(actual))^2))
        n <- length(actual)
        p <- length(stats::coef(k))
        aic <- n * log(mse) + 2 * p
        bic <- n * log(mse) + log(n) * p
        # Store fitted models and metrics
        fitted_models[[paste(model,
                             init$psill,
                             init$range,
                             init$nugget,
                             sep = "_")]] <- list(model = fit,
                                                  mse = mse,
                                                  rmse = rmse,
                                                  mae = mae,
                                                  r2 = r2,
                                                  aic = aic,
                                                  bic = bic)
        mse_values <- c(mse_values, mse)
        rmse_values <- c(rmse_values, rmse)
        mae_values <- c(mae_values, mae)
        r2_values <- c(r2_values, r2)
        aic_values <- c(aic_values, aic)
        bic_values <- c(bic_values, bic)
      }
    }
  }

  # Check if any models were successfully fitted
  if (length(fitted_models) == 0) {
    stop("No models were successfully fitted.")
  }

  # Find the best model and list all models in a tibble
  best_model <- names(fitted_models)[which.min(mse_values)]
  best_model <- fitted_models[[best_model]]
  best_model <- best_model$model

  # Store all models in a tibble
  all_models <- tibble::tibble(
    model = names(fitted_models),
    mse = mse_values,
    rmse = rmse_values,
    mae = mae_values,
    r2 = r2_values,
    aic = aic_values,
    bic = bic_values
  )

  # Provide a list of two objects: all_models and best_model
  list(all_models = all_models[order(all_models$mse), ],
       best_model = best_model)
}
