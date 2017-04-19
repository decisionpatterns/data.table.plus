#' Replace Prefix
#'
#' Convenience function for replacing prefixes
#'
#' @param x object to have prefix replaced
#' @param prefix string or regex without the separator
#' @param replace string used as replacement
#'
#'
#'
#' @seealso
#'  - `dp.misc::prefix`
#'  - `base.tools::nm_prefix`
#'  - `stringr.tools::str_prefix`
#'
#' @examples
#'
#'  dt <- data.table( i.a = 1:5, ii.b = 1:5)
#'  prefix_replace( dt, "i", "X." )
#'
#' @import lazyeval
#' @export

prefix_replace <- function( x, prefix, replace ) UseMethod('prefix_replace')

#' @rdname prefix_replace
#' @export

prefix_replace.data.table <- function(x, prefix, replace ) {

 data.table::setnames(
     x
   , names(x)
   , names(x) %>% str_replace(
                      paste0("^", prefix, "\\.")
                    , paste0( replace, "." )
                   )
   )

  x
}
