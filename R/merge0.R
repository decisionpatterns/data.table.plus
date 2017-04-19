#' Left (outer) join of data.tables replacing introduced NAs with default values
#'
#' Implements a left join between data.tables setting default values for
#' variables where the join is unequal.
#'
#' @param x left data.table
#' @param y right data.table
#' @param default value used where records between tables do not match
#' @param ... additional arguments passed to other functions
#'
#' @seealso
#'   `left_join`
#'
#' @examples
#'   \dontrun{
#'     data(iris)
#'     setDT(iris)
#'     merge0( iris, iris[,-3])
#'   }
#' @import na.actions
#' @export

merge0 <- function( x, y, default=0, ... ) {

  y <- merge( x[, key(x), with=FALSE], y, all.x=TRUE )


  # HANDLE MULTIPLE y COLUMNS
  cols <- setdiff( names(y), key(y) )
  y[ , (cols) := lapply(.SD, na.replace, value=default ), .SDcols=cols ]

  return( merge( x, y, ...) )

}
