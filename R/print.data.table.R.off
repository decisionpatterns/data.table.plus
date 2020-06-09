#' print.data.table
#'
#' Extends \code{print.data.table} by printing x followed by its key.
#'
#' @param x data.table
#' @param ... arguments passed to
#'
#' @details
#'
#' This is just a copy of [data.table:::print.data.table()] that uses a message
#' [keys_msg()] to display the keys when printed.
#'
#' @references
#'   [data.table:::print.data.table()]
#'
#' @return NONE, used for side effects only
#'
#' @examples
#'   data(iris)
#'   setDT(iris)
#'
#'   print(iris)
#'
#'   setkey(iris, Species )
#'   print(iris)
#'
#'   iris[ , rn := 1 ]
#'
#'
#' @export

print.data.table <-
  function (x,
            topn = getOption("datatable.print.topn"),
            nrows = getOption("datatable.print.nrows"),
            class = getOption("datatable.print.class"),
            row.names = getOption("datatable.print.rownames"),
            col.names = getOption("datatable.print.colnames"),
            print.keys = getOption("datatable.print.keys"),
            quote = FALSE,
            ...)
  {
    if (!col.names %in% c("auto", "top", "none"))
      stop("Valid options for col.names are 'auto', 'top', and 'none'")
    if (col.names == "none" && class)
      warning("Column classes will be suppressed when col.names is 'none'")
    if (!shouldPrint(x)) {
      SYS <- sys.calls()
      if (length(SYS) <= 2L ||
          (
            length(SYS) > 3L && is.symbol(thisSYS <- SYS[[length(SYS) -
                                                          3L]][[1L]]) &&
            as.character(thisSYS) %chin% mimicsAutoPrint
          )) {
        return(invisible(x))
      }
    }
    if (!is.numeric(nrows))
      nrows = 100L
    if (!is.infinite(nrows))
      nrows = as.integer(nrows)
    if (nrows <= 0L)
      return(invisible(x))
    if (!is.numeric(topn))
      topn = 5L
    topnmiss = missing(topn)
    topn = max(as.integer(topn), 1L)
    if (print.keys) {
      if (!is.null(ky <- key(x)))
        message("Key: <", paste(ky, collapse = ", "), ">")
      if (!is.null(ixs <- indices(x)))
        cat("Ind",
            if (length(ixs) > 1L)
              "ices"
            else
              "ex",
            ": <",
            paste(ixs, collapse = ">, <"),
            ">\n",
            sep = "")
    }
    if (nrow(x) == 0L) {
      if (length(x) == 0L)
        cat("Null data.table (0 rows and 0 cols)\n")
      else
        cat(
          "Empty data.table (0 rows) of ",
          length(x),
          " col",
          if (length(x) > 1L)
            "s",
          ": ",
          paste(head(names(x), 6L), collapse = ","),
          if (ncol(x) > 6L)
            "...",
          "\n",
          sep = ""
        )
      return(invisible(x))
    }
    if ((topn * 2 + 1) < nrow(x) &&
        (nrow(x) > nrows || !topnmiss)) {
      toprint = rbind(head(x, topn), tail(x, topn))
      rn = c(seq_len(topn), seq.int(to = nrow(x), length.out = topn))
      printdots = TRUE
    }
    else {
      toprint = x
      rn = seq_len(nrow(x))
      printdots = FALSE
    }
    toprint = format.data.table(toprint, na.encode = FALSE, ...)
    if ((!"bit64" %chin% loadedNamespaces()) && any(sapply(x,
                                                           inherits, "integer64")))
      require_bit64()
    if (isTRUE(row.names))
      rownames(toprint) = paste0(format(rn, right = TRUE, scientific = FALSE),
                                 ":")
    else
      rownames(toprint) = rep.int("", nrow(toprint))
    if (is.null(names(x)) || all(names(x) == ""))
      colnames(toprint) = rep("", ncol(toprint))
    if (isTRUE(class) && col.names != "none") {
      class_abb = c(
        list = "<list>",
        integer = "<int>",
        numeric = "<num>",
        character = "<char>",
        Date = "<Date>",
        complex = "<cplx>",
        factor = "<fctr>",
        POSIXct = "<POSc>",
        logical = "<lgcl>",
        IDate = "<IDat>",
        integer64 = "<i64>",
        raw = "<raw>",
        expression = "<expr>",
        ordered = "<ord>"
      )
      classes = vapply(x, function(col)
        class(col)[1L], "",
        USE.NAMES = FALSE)
      abbs = unname(class_abb[classes])
      if (length(idx <- which(is.na(abbs))))
        abbs[idx] = paste0("<", classes[idx], ">")
      toprint = rbind(abbs, toprint)
      rownames(toprint)[1L] = ""
    }
    if (quote)
      colnames(toprint) <- paste0('\\"', old <- colnames(toprint),
                                  '\\"')
    if (printdots) {
      toprint = rbind(head(toprint, topn + isTRUE(class)),
                      `---` = "", tail(toprint, topn))
      rownames(toprint) = format(rownames(toprint), justify = "right")
      if (col.names == "none") {
        cut_top(print(toprint, right = TRUE, quote = quote))
      }
      else {
        print(toprint, right = TRUE, quote = quote)
      }
      if (print.keys) keys_msg( key(x) )
      return(invisible(x))
    }
    if (nrow(toprint) > 20L && col.names == "auto")
      toprint = rbind(toprint, matrix(if (quote)
        old
        else
          colnames(toprint), nrow = 1L))
    if (col.names == "none") {
      cut_top(print(toprint, right = TRUE, quote = quote))
    }
    else {
      print(toprint, right = TRUE, quote = quote)
    }

    if (print.keys) keys_msg( key(x) )
    invisible(x)

  }


keys_msg <- function(x)  message( paste( "key: <", paste0( data.table::key(x), collapse = ", ")) )
keys_msg <- function(ky) message( "Key: <", paste(ky, collapse = ", "), ">" )

format.data.table <- function (x, ..., justify = "none")
{
    if (is.atomic(x) && !is.null(x)) {
        stop("Internal structure doesn't seem to be a list. Possibly corrupt data.table.")
    }
    format.item <- function(x) {
        if (is.null(x))
            ""
        else if (is.atomic(x) || inherits(x, "formula"))
            paste(c(format(head(x, 6L), justify = justify, ...),
                if (length(x) > 6L) "..."), collapse = ",")
        else paste0("<", class(x)[1L], ">")
    }
    char.trunc <- function(x, trunc.char = getOption("datatable.prettyprint.char")) {
        trunc.char = max(0L, suppressWarnings(as.integer(trunc.char[1L])),
            na.rm = TRUE)
        if (!is.character(x) || trunc.char <= 0L)
            return(x)
        idx = which(nchar(x) > trunc.char)
        x[idx] = paste0(substr(x[idx], 1L, as.integer(trunc.char)),
            "...")
        x
    }
    do.call("cbind", lapply(x, function(col, ...) {
        if (!is.null(dim(col)))
            stop("Invalid column: it has dimensions. Can't format it. If it's the result of data.table(table()), use as.data.table(table()) instead.")
        if (is.list(col))
            col = vapply_1c(col, format.item)
        else col = format(char.trunc(col), justify = justify,
            ...)
        col
    }, ...))
}
