#' setkeysfirst
#'
#' Reorder columns to put the key columns first.
#'
#' @param x data.table on which to reorder columns
#'
#' @details
#'
#' @return
#'   character vector with columns reodrdered so the key columns are first.
#'
#' @seealso
#'   \code{\link[data.table]{key}},
#'   \code{\link[data.table]{setcolorder}}
#'
#' @examples
#'
#'  data(iris)
#'  setDT(iris)
#'  setkey(iris, Species)
#'  setkeysfirst(iris)
#'  iris
#'
#' @export

setkeysfirst <- function( x ) {
  neworder <- c( key(x), names(x) ) %>% unique
  setcolorder( x, neworder )
  return( invisible(x) )
}

#' @rdname setkeysfirst
#' @export

setcolorderkeysfirst <- setkeysfirst
