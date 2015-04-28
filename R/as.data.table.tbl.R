#' Convert a dplyr table to a data.table by stripping the dplyr classes
#'
#' @param x dplyr tbl object
#'
#' @import dplyr
#' @export

as.data.table.tbl <- function(x) {
 setDT( as.data.frame.tbl(x) )
 return(x)
}


# as.data.table.tbl <- function(x) {
#   class(x) <- c('data.table','data.frame')
#   x
# }


