#' Data Frame Viewing
#'
#' Convenience function to view all the columns of the head
#' of a truncated \code{\link[base]{data.frame}}.  \code{peek} invisibly returns
#' \code{x}.  This makes its use ideal in a \pkg{dplyr}/\pkg{magrittr} pipeline.
#'
#' @param x A \code{\link[base]{data.frame}} object.
#' @param n Number of rows to display.
#' @param width The width of the columns to be displayed.
#' @param \ldots For internal use.
#' @return Prints a truncated head but invisibly returns \code{x}.
#' @seealso \code{\link[utils]{head}}
#' @export
#' @details By default \pkg{dplyr} does not print all columns of a data frame
#' (\code{tbl_df}).  This makes inspection of data difficult at times,
#' particularly with text string data.  \code{peek} allows the user to see a
#' truncated head for inspection purposes.
#' @examples
#' (dat1 <- r_data_frame(100, id, sentence, paragraph))
#' peek(dat1)
#' peek(dat1, n = 20)
#' peek(dat1, width = 40)
#'
#' library(dplyr)
#'
#' ## Use in a dplyr/magrittr pipeline to view the data (silly example)
#' par(mfrow = c(2, 2))
#'
#' r_data_frame(1000, id, sex, pet, employment, eye, sentence, paragraph) %>%
#'     peek %>%
#'     (function(x, ind = 2:5){ invisible(lapply(ind, function(i) pie(table(x[[i]]))))})
#'
#' ## A wider data set example
#' dat2 <- r_data_theme()
#'
#' dat2
#' peek(dat2)
peek <- 
function (x, n = 10, width = 10, ...) {
    WD <- options()[["width"]]
    options(width = 3000)
    o <- utils::head(truncdf(as.data.frame(x), width), n = n, 
        ...)
    header <- "Source: local data frame [%s x %s]\n\n"
    cat(sprintf(header, nrow(x), ncol(x)))
    out <- utils::capture.output(o)
    fill <- utils::tail(out, 1)
    nth_row <- paste(c(paste(rep(".", nchar(nrow(o))), collapse = ""), 
        sapply(1:ncol(o), function(i) {
            elems <- c(colnames(o)[i], as.character(o[[i]]))
            elems[is.na(elems)] <- "NA"
            lens <- max(nchar(elems), na.rm = TRUE)
            if (lens <= 3) return(paste(c(" ", rep(".", lens)), 
                collapse = ""))
            paste(c(rep(" ", (lens + 1) - 3), "..."), collapse = "")
        })), collapse = "")
    cat(paste(c(out, nth_row), collapse = "\n"), "\n")
    options(width = WD)
    invisible(x)
}

truncdf <-
function(x, end=10, begin=1) {
    x <- as.data.frame(x)
    DF <- data.frame(lapply(x, substr, begin, end), check.names=FALSE)
    names(DF) <- substring(names(DF), begin, end)
    class(DF) <- c("trunc", class(DF))
    DF
}



