#' Print compact data.table::tables info
#' 
#' Prints data.tables with a good defaults 
#'
#' @note (c)2013 Decision Patterns 
#' 
#' @seealso \code{\link[data.table]{tables}}
#' 
#' @import data.table
#'   
#' @export

tb <- function() data.tables::tables( width=45, env=.GlobalEnv )

