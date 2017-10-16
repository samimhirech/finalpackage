#' Multi Excel
#'
#' @param file is a file
#'
#' @return the sheets of an excel file
#' @import readxl
#' @import assertthat
#' @export
#'
#'

multi_excel <- function(file) {
  assert_that(has_extension(file,"xlsx") | has_extension(file,"xls"))
  all_sheets <- excel_sheets(file)
  result <- lapply(all_sheets,function(sheet) {
    read_excel(file,sheet = sheet)
  })
  return(result)
}
