#' Generate Random Factor Vector
#'
#' Generate a random vector and coerces to a factor.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param x A vector of elements to chose from.
#' @param prob A vector of probabilities to chose from.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random actor vector of elements.
#' @export
#' @seealso [base::sample()]
#' @examples
#' r_sample_factor(100, name = "Var")
#' table(r_sample_factor(x = c("Dog", "Cat", "Fish", "Bird"), n=1000))
#' r_sample_factor(x = c("B", "W"), prob = c(.7, .3), n = 25)
r_sample_factor <- function(n, x = LETTERS, prob = NULL, name = "Factor") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x)
    varname(out, name)

}

