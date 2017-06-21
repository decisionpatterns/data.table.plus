#' setprefix
#'
#' set/change  prefix on column names
#'
#' @param x data.table
#' @param old string possibly a regex (there is no need to add "^")
#' @param new string
#'
#' @details
#' \code{setprefix} works similar to \code{\link[data.table]{setnames}} but
#' works only on the beginning of names not the whole names by swapping out the
#' beginning.
#'
#' @seealso
#'   \code{\link[data.table]{setnames}}
#'
#' @examples
#' x <-data.table( i.x=1:10, i.y=1:10 )
#' x %>% setprefix( "i.", "x." )
#' names(x)
#'
#' @import stringr.tools
#' @export

setprefix <- function(x,old,new) {

  old_regex <- paste0("^",old)
  old_names <- names(x) %>% str_grep( old_regex )

  new_names <- old_names(x) %>% str_replace( old_regex, new  )
  setnames(x,old_names,new_names )

  invisible(x)

}
