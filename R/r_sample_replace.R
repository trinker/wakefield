#' Generate Random Vector (Without Replacement)
#'
#' Generate a random vector without replacement.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param x A vector of elements to chose from.
#' @param prob A vector of probabilities to chose from.
#' @param replace logical.  If `TRUE` sampling is done with replacement.
#' Default is without replacement.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random vector of elements.
#' @include utils.R
#' @seealso [base::sample()]
#' @export
#' @examples
#' r_sample(100, name = "Var")
#' table(r_sample(x = c("Dog", "Cat", "Fish", "Bird"), n=1000))
#' r_sample(x = c("B", "W"), prob = c(.7, .3), n = 25, name = "Race")
#' r_sample(25, x = c(TRUE, FALSE))
r_sample_replace <-
function (n, x = 1:100, prob = NULL, replace = FALSE, name = "Sample") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = replace, prob = prob)
    varname(out, name)

}
