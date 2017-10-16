#' Draw a name
#'
#' @param the_name is a name
#' @param the_sex is either "F" or "M"
#'
#' @return the graph of the popularity of the name accross history
#'
#' @import ggplot2
#' @import prenoms
#' @import dplyr
#' @import tidyr
#' @import magrittr
#' @import assertthat
#'
#' @export
draw_a_name <- function(the_name,the_sex) {
  assert_that(is.character(the_name))
  assert_that(is.character(the_sex))
  assert_that(the_sex == "F" | the_sex == "M")
  dataset <- prenoms::prenoms %>%
    filter(name == the_name, sex == the_sex) %>%
    group_by(name,year) %>%
    summarise(total = sum(n))
  ggplot(dataset,
         aes(x = year, y = total)) +
    geom_line() +
    ggtitle(the_name)
}
