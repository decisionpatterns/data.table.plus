#' Move columns to the beginning
#'
#' @param a data.table
#' @param first vector; character (names of columns) integer
#'   (column numbers)
#'
#' @examples
#'   data(iris)
#'   setDT(iris)
#'
#'   setcolfirst(iris,"Species")
#'
#' @export

setcolfirst <- function(x, first) {

  .Deprecated("`data.table::setcolorder()`", "data.table.plus")

  setcolorder(x, first)

}
