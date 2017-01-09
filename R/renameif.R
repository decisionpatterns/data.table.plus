#' renameif
#'
#' Renames a column if already exists otherwise doesn't do a thing
#'
#' @param x table
#' @param old string; old name
#' @param new string; new name@name
#'
#' @details
#'
#' Renames a column on the condition that it exists
#'
#' Does not take mu
#' Made with pipes in mind.
#'
#' @export``

renameif <- function(x,old,new) {
  if( old %in% names(x) )
    setnames(x,old,new)
}
