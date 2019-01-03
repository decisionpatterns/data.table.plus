#' dt_left_join
#'
#' Perform a dt
#' @param x,y data.tables to join
#' @param by chaacter; colums to match can by named
#'
#' @details
#'
#' columns are reorder so that
#'
#' @return
#' a data.tale
#'
#' @seealso
#'   \code{\link[data.table]{data.table}}
#'
#' @examples
#'
#' lhs <- data.table( letters=letters[1:10], i=1:10 )
#' rhs <- data.table( letters=letters[1:5], x=5:1 )
#'
#' # setkey(lhs, letters )
#' # setkey(rhs, letters )
#'
#' lhs %>% dt_left_join( rhs, by="letters" )
#' lhs %>% dt_left_join( rhs, by="letters" )
#'
#' @export

dt_left_join <- function( x, y, by, ... ) {


  # rhs. <- copy(rhs)
  # base.tools::nm_prefix( rhs., paste0(by,".") )

  ret <- y[ x, on=by, ...]

  ## Reorder cols
  setcolorder(ret, intersect( names(x), names(ret) ) )  # RETAIN ORDER

  ret

}
