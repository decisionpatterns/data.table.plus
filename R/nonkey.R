#' Get non-keys from a table
#'
#' Return the names of non-key columns
#'
#' @param x a data set that may have a key
#'
#' @return
#' character
#'
#' @examples
#' data(iris)
#' setDT(iris)
#'
#' nonkeys(iris)
#'
#' setkey(iris, Species )
#' key(iris)
#' nonkey(iris)
#' setkey( iris, Species, Sepal.Length )
#'
#' @export

nonkey <- function(x) setdiff( names(x), data.table::key(x))
