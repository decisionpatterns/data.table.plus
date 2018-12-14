#' Convert vectors to data tables and vice versa
#'
#' @param x atomic vector
#' @param key,value Names of the columns that store the keys and values.
#'
#' @details
#'
#' `entable` converts a data.table from an atomic vector. The vector becomes a
#' table column named `value` which, by default, is named after `x`.
#'
#'  If the vector is named, a two-column data table is produced. The first
#'  column is the names of x and is named by the `key` argument. The key
#'  defaults to `.key`.
#'
#'  A key is created for the first column.
#'
#' @return A one or two column [data.table] with a key on the first column.
#'
#' @seealso
#'   - [data.table::setkey()]
#'   - `tibble::enframe()` - from which this function is loosely inspired.
#'
#' @examples
#'   x = 1:3
#'   entable(x)
#'   names(x) <- letters[x]
#'   entable(x)
#'   entable(x, name="letter")
#'
#'   entable(x)
#'
#' @export

entable <- function(x, key = ".key", value=as.character(substitute(x)) ) {

  if( length(value) > 1 )
    value <- paste0(value, collapse="")

  value <- make.names(value)

  dt <- as.data.table(x, keep.rownames = TRUE)

  if( ncol(dt) == 1 )
      setnames(dt, names(dt), value ) else
  if( ncol(dt) == 2 )
      setnames(dt, names(dt), c(key,value) ) else
  stop("entable does not support multi-dimensional arrays")

  setkeyv(dt, names(dt)[[1]] )
  dt
}
