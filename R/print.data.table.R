#' print.data.table
#'
#' Extends \code{print.data.table} by printing x followed by its key.
#'
#' @param x data.table
#' @param ... arguments passed to
#'
#'
#' @return NONE, used for side effects only
#'
#' @examples
#'   data(iris)
#'   setDT(iris)
#'
#'   print(iris)
#'
#'   setkey(iris, Species )
#'   print(iris)
#'
# @import data.table
#' @export

print.data.table <- function( x, ... ) {

  `data.table`:::print.data.table( x=x,  ... )
  message( paste( "key :", paste0( data.table::key(x), collapse = ", ")) )

  invisible()

}
