#' Generate Random Integer Vector
#'
#' Generate a random integer vector.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random integer vector of elements.
#' @seealso \code{\link[base]{sample}}
#' @include utils.R r_sample_integer.R
#' @export
#' @examples
#' r_sample_integer(100, name = "Var")
#' table(r_sample_integer(x = c("Dog", "Cat", "Fish", "Bird"), n=1000))
#' r_sample_integer(x = c("B", "W"), prob = c(.7, .3), n = 25, name = "Race")
#' r_sample_integer(25, x = c(TRUE, FALSE))
r_sample_integer <- hijack(r_sample, name = "Integer")

