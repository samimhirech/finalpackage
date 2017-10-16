#' Save as csv
#'
#' @param dataset is a dataset
#' @param filename is a file name
#' @param row.names is FALSE
#' @param ... is what you want
#'
#'
#' @return a csv file
#'
#' @import assertthat
#' @import magrittr
#'
#' @export
#'

save_as_csv <- function(dataset,filename, row.names = FALSE, ...) {
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))

  write.csv2(dataset, file = filename, row.names = row.names, ...)

  invisible(normalizePath(filename))
}
