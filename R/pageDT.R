#' page through a data.table by key
#' 
#' @param x data.table
#' @param by character containing column names of x that should be paged through
#' 
#' pageDT allows the user to interacitvely page through a data.table stepping 
#' through by the values of a key.   
#' 
#' The commands generally follow those of \code{\link[base]{browser}}
#' n - next key 
#' Q - quit
#'
#'
#' @author 
#'   Christopher Brown
#' 
#' @seealso 
#'   \code{\link[base]{browser}}
#'   \code{\link[base]{readline}}
#'   
#' @examples   
#'   \dontrun{ 
#'  #  data(iris) 
#'  #   setDT( iris )
#'  #   setkey( iris, Species )
#'  #   pageDT( iris ) 
#'   }
#'
#' @note TODO
#'   - remove key columns
#' @export      

pageDT <- function(x, by=key(x) ) { 
  
 keys <- x[ ! duplicated(x), by, with=FALSE ]
 
 for( i in nrow(keys) %>% seq ) { 
 
   # DISPLAY KEY
   keys_string <- 
   message( "key : ", keys[i, ] %>% t %>% paste0( collapse=", ") )
   dt <- x[ keys[i,] ]
   
   # REMOVE KEYS ... NOT NECES
   dt[ , key(dt) := NULL ]
   
   # DISPLAY TABLE
   dt %>% print   
   
   message( "end key : ", keys[i, ] %>% t %>% paste0( collapse=", ") )
  
   if( readline() == 'Q' ) return( invisible(NULL))
   
   
#    if(TRUE) {
#      cmd <- readline()
#    
#      switch( cmd 
#        , Q = return() 
#        , n = next()
#        , f = next() 
#        , eval(cmd)       
#      )
#    }
        
 }

}
