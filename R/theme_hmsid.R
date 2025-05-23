#' Custom ggplot2 theme function
#'
#' @param base_size base font size
#' @param text_size plot text size
#' @param subtitle_size,subtitle_margin plot subtitle size and margin
#' @param plot_title_size,plot_title_margin plot title size and margin
#' @param ... Other arguments passed to \code{theme_hmsid}
#'
#' @return A customized theme for a ggplot object.
#' @export
#' @import ggplot2
#' @import sysfonts
#' @import showtext
#' @examples
#' library(ggplot2)
#' dat <- data.frame(
#'   x = seq_along(1:5),
#'   y = rnorm(n = 5, mean = 0.5, sd = 1)
#' )
#' dat |>
#'   ggplot(aes(x = x, y = y)) +
#'   geom_line() +
#'   hmsidwR::theme_hmsid()
#'
theme_hmsid <- function(base_size, text_size,
                        subtitle_size, subtitle_margin,
                        plot_title_size, plot_title_margin, ...) {
  sysfonts::font_add_google("Open Sans", "Open Sans")
  showtext::showtext_auto()
  ggplot2::theme_minimal() +
    ggplot2::theme(
      text = ggplot2::element_text(size = 12, family = "Open Sans"),
      axis.line = ggplot2::element_line(color = "#29306c",
                                        linewidth = 0.5),
      panel.background = ggplot2::element_rect(fill = "#ebecf7"),
      panel.grid.major = ggplot2::element_line(color = "white"),
      panel.grid.minor = ggplot2::element_blank(),
      legend.position.inside = c(0.9, 0.7),
      legend.background = ggplot2::element_rect(fill = "transparent"),
      complete = TRUE
    )
}
