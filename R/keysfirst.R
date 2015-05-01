#' keysfirst
#'
#'  data.table names with the keys expressed fist
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
#'     dt %>% setcolorder( keysfirst(dt))
#'   }
#'
# @import data.table
#'
#' @export

keysfirst <- function( data )
  c( key(data), names(data) ) %>% unique
