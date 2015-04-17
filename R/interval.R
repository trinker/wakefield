#' Cut Numeric Into Factor
#'
#' A wrapper for \code{\link[base]{cut}} that cuts the vector and then adds the
#' \code{varname} produced by the original function.
#'
#' @param fun A vector producing function.
#' @param breaks Either a numeric vector of two or more unique cut points or a
#' single number (greater than or equal to 2) giving the number of intervals
#' into which the vector produced from \code{fun} is to be cut.
#' @param \ldots Other arguments passed to \code{fun}.
#' @param labels Labels for the levels of the resulting category. By default,
#' labels are constructed using "(a,b]" interval notation. If
#' \code{labels = FALSE}, simple integer codes are returned instead of a factor.
#' @param include.lowest logical.  If \code{TRUE} an 'x[i]' equal to the lowest
#' (or highest, for \code{right = FALSE}) 'breaks' value should be included.
#' @param right logical.  If \code{TRUE} the intervals will be closed on the
#' right (and open on the left).
#' @param dig.lab An integer which is used when labels are not given. It
#' determines the number of digits used in formatting the break numbers.
#' @param ordered_result logical.  If \code{TRUE} the result be an ordered
#' factor.
#' @param n The number elements to generate.  This can be globally set within
#' the environment of \code{r_data_frame} or \code{r_list}.
#' @return Returns a \code{\link[base]{cut}} factor vector.
#' @keywords cut interval
#' @export
#' @seealso \code{\link[base]{cut}}
#' @examples
#' interval(normal, 4, n=100)
#' attributes(interval(normal, 4, n=100))
#' interval(age, 3, n = 1000)
interval <-  function(fun, breaks, ..., labels = NULL, include.lowest = FALSE,
    right = TRUE, dig.lab = 3, ordered_result = FALSE, n){

    out <- fun(n = n, ...)
    out2 <- cut(out, breaks = breaks, labels = labels,
        include.lowest = include.lowest, right = right, dig.lab = dig.lab,
        ordered_result = ordered_result)
    varname(out2, attributes(out)[["varname"]])

}
