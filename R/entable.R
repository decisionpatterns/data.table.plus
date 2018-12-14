#' Convert vectors to data frames and vice versa
#'
#' @param x atomic vector (named)
#' @param name,value Names of the columns that store the names and values.
#'   If `name` is `NULL`, a one-column tibble is returned; `value` cannot be `NULL`.
#'
#' @return A [data.table] with two columns (if `name` is not `NULL`, the default)
#'   or one column (otherwise).#'
#' @seealso
#'   `tibble::enframe()`
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

entable <- function(x, name = ".key", value=as.character(substitute(x)) ) {

  if( length(value) > 1 )
    value <- paste0(value, collapse="")

  value <- make.names(value)

  dt <- as.data.table(x, keep.rownames = TRUE)
  if( ncol(dt) == 1 )
      setnames(dt, names(dt), value ) else
  if( ncol(dt) == 2 )
      setnames(dt, names(dt), c(name,value) ) else
  stop("entable does not support multi-dimensional arrays")

  setkeyv(dt, names(dt)[[1]] )
  dt
}
