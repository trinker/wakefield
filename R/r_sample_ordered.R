#' Generate Random Ordered Factor Vector
#'
#' Generate a random vector and coerces to an ordered factor.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of elements.
#' @export
#' @keywords ordered factor
#' @seealso [base::sample()],
#' [base::ordered()]
#' @examples
#' r_sample_ordered(100, name = "Var")
#'
#' lvls <- c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree")
#' table(r_sample_ordered(x = lvls, n=1000))
#'
#' (out <- r_sample_ordered(x = c("Black", "Grey", "White"),
#'     prob = c(.5, .2, .3), n = 100))
#' slices <- c(table(out))
#' pie(slices, main="Pie Chart of Colors", col = tolower(names(slices)))
r_sample_ordered <- function(n, x = LETTERS[1:5], prob = NULL, name = "Ordered") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- ordered(out, levels = rev(x))
    varname(out, name)

}





