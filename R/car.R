#' Generate Random Vector of Cars
#'
#' Generate a random vector of cars (see \code{?\link[datasets]{mtcars}}).
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of car elements.
#' @keywords car
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' car(10)
#' table(car(10000))
car <- function(n, x = rownames(datasets::mtcars), prob = NULL, name = "Car") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x)
    varname(out, name)

}
