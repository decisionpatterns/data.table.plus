#' Automatically set data.table keys
#'
#' Atomatically sets the keys of a data.table based on \code{options}.
#'
#' @param x data.table that will get autokeys set.
#' @param keys character; the values to set for keys if present in \code{dt}.
#'
#' \code{autokey} sets the keys for a data.table. The default is to look at the
#' \code{getOption('autokey')} for the list available keys. It is equivalent
#' to setting the \code{cols} argument of \code{setkeyv} equivalent to:
#'
#' \code{ intersect( names(x), getOption('autokey') ) }
#'
#' @seealso
#'   \code{setkeyv} in the \code{data.table} package.
#'
#' @examples
#'   options( autokey='Species' )
#'   data(iris)
#'   setDT(iris)
#'   autokey(iris)
#'
#' @export

  autokey <- function( x, keys=getOption('autokey') ) {

    if( data.table::is.data.table(x) )
      data.table::setkeyv( x, intersect( names(x), keys ) )

  }

#' Set the autokeys
#'
#' Set the column for autokeys
#'
#' @param cols character; column names to be automatically set as keys
#'
#' This is nothing more than a wrapper for options(autokey=x)
#'
#' @rdname autokey
#' @export
  set_autokeys <- function(cols) options(autokey=cols)

#' Get the autokeys
#'
#' Get the vector of autokeys
#'
#' Simple wrapper of \code{getOption('autokey')}
#' @rdname autokey
#' @export
  autokeys <- function() getOption( 'autokey')
