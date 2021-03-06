#' names_keys_first
#'
#' data.table names with the keys expressed first
#'
#' @param data data to return
#'
#' @return
#'   character vector; the names
#'
#' @seealso
#'   \code{\link[base]{names}}
#'   \code{\link[data.table]{key}}
#'
#' @examples
#'   \dontrun{
#'     dt %>% setcolorder( keysfirst(dt) )
#'   }
#'
#' @export

names_keys_first <- function( data )
  c( key(data), names(data) ) %>% unique

#' @export
#' @rdname names_keys_first

 keysfirst  <- names_keys_first
