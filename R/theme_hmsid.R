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
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' dat <- data.frame(x=seq_along(1:5),
#'                   y=rnorm(n = 5,mean = 0.5,sd = 1))
#' dat |>
#' ggplot(aes(x=x,y=y))+
#' geom_line()+
#' theme_hmsid()
#' }
#'
theme_hmsid <- function(base_size,text_size,
                        subtitle_size,subtitle_margin,
                        plot_title_size,plot_title_margin,...) {
  ggplot2::theme_minimal() +
    ggplot2::theme(
    text = ggplot2::element_text(size = 12, family = "Open Sans"),
    #axis.text = element_text(color = "blue"),
    axis.line = ggplot2::element_line(color = "#29306c", size = 0.5),
    panel.background = ggplot2::element_rect(fill = "#ebecf7"),
    panel.grid.major = ggplot2::element_line(color = "white"),
    panel.grid.minor = ggplot2::element_blank(),
    legend.position = c(0.9,0.7),
    legend.background = ggplot2::element_rect(fill = "transparent")
  )
}



# showtext::showtext_auto()
# sysfonts::font_add(regular = "OpenSans-VariableFont_wdth,wght.ttf" ,
#                    family = "Open Sans")
# library(ggplot2)
# set.seed(123)
# dat <- data.frame(x=seq_along(1:10),
#                   y=rnorm(n = 10,mean = 0.5,sd = 1),
#                   z=rep(c("a","b"),10))
# dat |>
# ggplot(aes(x=x,y=y,group=z,color=z))+
# geom_line()+
#   labs(title="Pick of infection in location a and b",
#        caption = "Synthetic data | FG")+
# theme_hmsid()
