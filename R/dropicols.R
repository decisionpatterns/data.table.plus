#' dropicols
#'
#' Drop columns prefixed by `i.*` these may be remenants of a join.
#'
#' @param x data.table
#'
#' @details
#'
#' During a merge/join matching columns in the two merge tables get a prefix.
#' The i-argument recieves a prefix \code{i.}; these colmns may not be wanted.
#' \code{dropicols} removes these columns from a data table.
#'
#' @import stringr.tools

dropicols <- function(x) {

  nms <- names(x) %>% stringr.tools::str_grepv("^i[.]")
  if( length(nms) == 0 )
    warning("All columns match ^i[.]`; no columns will be returned.")

  x[ , xnms , with=FALSE  ]

}
