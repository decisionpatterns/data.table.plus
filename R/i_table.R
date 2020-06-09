#' Create a table for use in data.tables i slot
#'
#' @param .data data.table
#' @param x character; name of character columns

i_table <- function(.data, x) {
  .data[, x, with=FALSE ]
}
