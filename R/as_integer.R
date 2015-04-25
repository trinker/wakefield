#' Convert a Factor Data Frame to Integer
#'
#' Converts a \code{\link[base]{data.frame}} of \code{\link[base]{factor}}s to
#' integers.
#'
#' @param x A \code{\link[base]{data.frame}} of \code{\link[base]{factor}}s.
#' @param fun An \code{as.} coercion function to apply to each column.  Default
#' is \code{\link[base]{as.integer}}.
#' @return Returns a \code{\link[base]{data.frame}} equal to the
#' \code{\link[base]{class}} of \code{x} with integer columns rather than factor.
#' @keywords integer numeric
#' @export
#' @seealso \code{\link[wakefield]{r_series}}
#' @examples
#' as_integer(r_series(likert_7, 5, 10))
as_integer <- function(x, fun = as.integer) {
    x[] <- lapply(x, fun)
    x
}
