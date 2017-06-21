#' Left or right rolling join
#'
#' Perform rolling join
#'
#' @param x, y data.table
#' @param on character vector of join columns. The last is the join column
#' @param roll direction and allowed size of the roll. see ?data.table.
#'
#' @author Decision Patterns
#'
#' @details
#'
#' It is best to think of x as the m
#'
#' ## Duplicated y's
#'
#' 1. It is often expected that \code{nrow(results)} equals
#' \code{nrow(x)}. This is not true when are duplicated rows in y; it maybe important to
#' the application to dedupe the rows of y before joining?
#'
#' 2. When deduping y, ensure that you are taking the correct duplicate.
#' \code{unique} retains the first occerence.
#'
#' @note
#'  - The name `roll` comes from the data.table/ts rolling joins
#'  - `zip` is also an interesting name -- zipping on a fields with
#'    `roll` telling what to do first
#'
#' @return
#' a data.table object with
#'
#' @seealso
#'   \code{\link[dplyr]{left_join}},
#'   \cpde{\link[data.table]{[.data.table]}}
#'
#' @examples
#'
#' set.seed(1)
#' x <- data.table(
#'          letter=sample(letters[1:2],10, replace=TRUE)
#'        , year_x=sample( 2000:2010, 10, replace=TRUE )
#'      )
#' x <- x[ order(letter, year_x) ]
#' #' x <- unique(x)
#'
#' y <- data.table(
#'          letter=sample(letters[1:2],5, replace=TRUE)
#'        , year_y=sample( 2000:2010, 5, replace=TRUE )
#'      )
#' y <- y[ order(letter, year_y) ]
#' y <- unique(y)
#' y
#'
#' # on=c('letter','year')
#' on=c('letter',year_x='year_y')
#' roll=Inf
#'
#'
#' ret <- left_roll(x,y,on=on,roll=roll)
#' ret[ letter=="a"]; x[letter=="a"]; y[ letter=="a"]
#' ret[ letter=="b"]; x[letter=="b"]; y[ letter=="b"]
#'
#'
#' @export


left_roll <- function(x, y, on, roll, ... ) {

  roll_col <- on[ length(on) ]
  on[ length(on) ] <- ".roll_date."
  names(on)[length(on)] <- ".roll_date."

  has_names <- roll_col %>% names %>% is.null %>% not
  if( has_names ) {
    roll.y = roll_col
    roll.x = names(roll_col)
  } else {
    roll.x = roll.y = roll_col
  }

  x[ , .roll_date. := get(roll.x) ]
  y[ , .roll_date. := get(roll.y) ]

  ret <- y[ x, on=on, roll=roll, ... ]

  # CLEAN UP

  ## REMOVE .roll_date.
  ret[ , .roll_date. := NULL ]      # REMOVE .roll_date.
  x[   , .roll_date. := NULL ]
  y[   , .roll_date. := NULL ]

  ## Reorder cols
  setcolfirst(ret, intersect( names(x), names(ret) ) )  # RETAIN ORDER

  ret

}
