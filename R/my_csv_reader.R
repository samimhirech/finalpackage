#' My csv reader
#'
#' @param x a path
#'
#' @return this returns the csv file
#' @import assertthat
#' @export
#'
#'
#'

my_csv_reader <- function(x) {
  assert_that(is.dir(x))
  liste <- list.files(path = x,full.names = TRUE)
  result <- list()
  for (i in (1:length(liste))) {
    result <- list(read.csv(liste[i], header = TRUE, sep = ";", dec = "."))
  }
  return(result)
}
