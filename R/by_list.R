#' Turn a list of variables into a by list
#'
#' @return
#'
#' names list; values are the names
#'
#' @examples
#'
#' mpg %>% by_list( c("year","trans" ) )
#'
#' @export

by_list <- function(.data, x) {
  .data[ , x, with=FALSE  ] %>% as.list
}

