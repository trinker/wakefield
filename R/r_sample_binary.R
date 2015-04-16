#' Generate Random Binary Vector
#'
#' Generate a random binary (0/1) vector.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of \code{r_data_frame} or \code{r_list}.
#' @param prob A vector of probabilities to chose from.
#' @param name The name to assign to the output vector's \code{varname}
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of \code{r_data_frame} or \code{r_list}.
#' @return Returns a random binary (0/1) vector of elements.
#' @seealso \code{\link[base]{sample}}
#' @export
#' @examples
#' r_sample_binary(100, name = "Var")
#' table(r_sample_binary(1000))
#' c("B", "W")[r_sample_binary(10)]
r_sample_binary <-
function (n, prob = NULL, name = "Binary") {

    if (missing(n)) stop("`n` is missing")
    out <- sample.int(n = 2, size = n, replace = TRUE, prob = prob) - 1
    varname(out, name)

}

