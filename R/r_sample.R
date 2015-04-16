#' Generate Random Vector
#'
#' Generate a random vector.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of elements.
#' @include utils.R
#' @seealso \code{\link[base]{sample}}
#' @export
#' @examples
#' r_sample(100, name = "Var")
#' table(r_sample(x = c("Dog", "Cat", "Fish", "Bird"), n=1000))
#' r_sample(x = c("B", "W"), prob = c(.7, .3), n = 25, name = "Race")
#' r_sample(25, x = c(TRUE, FALSE))
r_sample <-
function (n, x = 1:100, prob = NULL, name = "Sample") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    varname(out, name)

}

