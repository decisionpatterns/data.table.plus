#' Convert a dplyr table to a data.table by stripping the dplyr classes
#'
#' @param x tbl object
#' @param keep.rownames logical; unused but kepy to match as.data.table generic
#'
#' @seealso
#'
#'  - [tibble::as.tibble()]
#'
#' @examples
#'
#'  tbl <- as.tibble(iris)
#'  dt <- as.data.table(iris)
#'
#'  class(tbl)
#'  class(dt)
#'
#' @export

as.data.table.tbl <- function(x, keep.rownames=FALSE ) {
 setDT( x )
 return(x)
}

# #' @export
#
# as.data.table <- data.table::as.data.table
