#' Move columns to the beginning
#'
#' @param a data.table
#' @param firstcols vector; character (names of columns) integer
#'   (column numbers)
#'
#' @examples
#'
#'   data(iris)
#'   setDT(iris)
#'
#'   setcolfirst(iris,"Species")
#'
#'
#' @export

setcolfirst <- function(x, firstcols) {

  if( is.integer(firstcols) ) {
    cols <- 1:ncol(x)
  } else {
    cols <- names(x)
  }

  neworder <- c( firstcols, setdiff(cols, firstcols))

  setcolorder(x,neworder)

  return(x)

}
