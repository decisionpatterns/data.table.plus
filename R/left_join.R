#' left_join
#'
#' implements a default left join for data.table
#'
#' @param x data.table
#' @param i object
#'
#' @details
#'
#' By convention DT implements `DT[X]` as a RIGHT JOIN. This convention promotes
#' facts, i.e. the most quickly varying values to be on the RHS of the result.
#' This is anathema to the convention of modeling where the Y's are expressed
#' first.
#' `
#' @examples
#'
#'  x <- data.table( letters=letters, i=1:26 )
#'  setkey(x, letters )
#'
#'  rhs <- data.table( letters=letters[1:5], i=1:5 )
#'  setkey(rhs, letters )
#'
#'  data.table:::`[.data.table`(x,rhs)      # RIGHT JOIN
#'
#'  options( datatable.default.left.join = FALSE )
#'  x[rhs, on=.(letters)]                     # LHS JOIN
#'  options( datatable.default.left.join = TRUE )
#'  x[rhs, on=.(letters)]
#'
#' @rdname left_join
#' @export

"[.data.table" <- function (x, i, ...) {

  if( getOption( "datatable.default.left.join", FALSE )  ) {

  # Swap x <-> i
    if( is.data.table(i) ) {
      x. <- i
      i. <- x
    }

    dt <- data.table:::`[.data.table`(x., i., ...)
    prefix_replace(dt, "i", lazyeval::expr_text(i) )

  } else {
    dt <- data.table:::`[.data.table`(x, i, ...)
  }

  dt
}
