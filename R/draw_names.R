#' Draw names
#'
#' @param names a vector of names
#'
#' @return the graph of the popularity of your names
#'
#' @import ggplot2
#' @import prenoms
#' @import dplyr
#' @import tidyr
#' @import assertthat
#'
#' @export
#'

draw_names <- function(names) {
  assert_that(is.character(names))
  dataset_first <- prenoms::prenoms %>%
    filter(name %in% names ) %>%
    group_by(name,year) %>%
    summarise(total = sum(n))

  ggplot(dataset_first,
         aes(x = year, y = total, color = name)) +
    geom_line()
}
