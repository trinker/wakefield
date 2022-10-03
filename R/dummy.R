#' Generate Random Dummy Coded Vector
#'
#' Generate a random dummy coded (0/1) vector.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param prob A vector of probabilities to chose from.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random dummy vector of (0/1) elements.
#' @seealso [base::sample.int()]
#' @family variable functions
#' @export
#' @examples
#' dummy(100, name = "Var")
#' table(dummy(1000))
dummy <-
function (n, prob = NULL, name = "Dummy") {

    if (missing(n)) stop("`n` is missing")
    out <- sample.int(n = 2, size = n, replace = TRUE, prob = prob) - 1
    varname(out, name)

}
