#' Convert a dplyr table to a data.table by stripping the dplyr classes
#'
#' @param x dplyr tbl object
#'
#' @import dplyr
#' @export

as.data.table.tbl <- function(x, keep.rownames=FALSE ) {
 setDT( dplyr::as.data.frame.tbl(x) )
 return(x)
}
