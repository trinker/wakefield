#' Convert a Factor Data Frame to Integer
#'
#' Converts a [base::data.frame()] of [base::factor()]s to
#' integers.
#'
#' @param x A [base::data.frame()] of [base::factor()]s.
#' @param cols Numeric indices of the columns to incude (use `-` to exclude
#' as well).  Default is to assign random `NA`s to all columns except the
#' first column.
#' @param fun An `as.` coercion function to apply to each column.  Default
#' is [base::as.integer()].
#' @return Returns a [base::data.frame()] equal to the
#' [base::class()] of `x` with integer columns rather than factor.
#' @keywords integer numeric
#' @export
#' @seealso [wakefield::r_series()]
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
