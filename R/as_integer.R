#' Convert a Factor Data Frame to Integer
#'
#' Converts a \code{\link[base]{data.frame}} of \code{\link[base]{factor}}s to
#' integers.
#'
#' @param x A \code{\link[base]{data.frame}} of \code{\link[base]{factor}}s.
#' @param cols Numeric indices of the columns to incude (use \code{-} to exclude
#' as well).  Default is to assign random \code{NA}s to all columns except the
#' first column.
#' @param fun An \code{as.} coercion function to apply to each column.  Default
#' is \code{\link[base]{as.integer}}.
#' @return Returns a \code{\link[base]{data.frame}} equal to the
#' \code{\link[base]{class}} of \code{x} with integer columns rather than factor.
#' @keywords integer numeric
#' @export
#' @seealso \code{\link[wakefield]{r_series}}
#' @examples
#' as_integer(r_series(likert_7, 5, 10))
#' as_integer(r_series(likert_7, 5, 10), cols = c(2, 4))
#'
#' library(dplyr)
#' r_data_frame(n=100,
#'     age,
#'     political,
#'     sex,
#'     grade
#' ) %>%
#'     as_integer(2:3)
as_integer <- function(x, cols = NULL, fun = as.integer) {

    if (is.null(cols)) {
        x[] <- lapply(x, fun)
    } else{
        x[cols] <- lapply(x[cols], fun)
    }
    x
}
