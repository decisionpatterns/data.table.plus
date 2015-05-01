#' Convert a dplyr table to a data.table by stripping the dplyr classes
#'
#' @param x dplyr tbl object
#' @param keep.rownames logical; unused but kepy to match as.data.table generic
#'
#' @import dplyr
#' @export

as.data.table.tbl <- function(x, keep.rownames=FALSE ) {
 setDT( dplyr::as.data.frame.tbl(x) )
 return(x)
}
