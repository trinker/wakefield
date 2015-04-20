##' Generate Random Vector of Number of Children
#'
#' Generate a random vector of number of children.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of number of children elements.
#' @keywords children
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' children(10)
#' pie(table(children(100)))
children <- hijack(r_sample,
    name = "Children",
    x = 0:10,
    prob = c(.25, .25, .15, .15, .1, rep(.1/5, 4), .01, .01)
)


