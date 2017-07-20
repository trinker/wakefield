#' Generate Random Vector of Names
#'
#' Generate a random vector of first names. This dataset includes all unique entries
#' from the \code{babynames} package.
#'
#' @inheritParams r_sample_replace
#' @return Returns a random vector of name elements.
#' @keywords name
#' @export
#' @include wakefield-package.R utils.R r_sample_replace.R
#' @family variable functions
#' @examples
#' name(10)
#' name(100)
#' name(1000, replace = TRUE)
name <- function (n, x = wakefield::name_neutral, prob = NULL, replace = FALSE,
    name = "Name") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = replace, prob = prob)
    varname(out, name)

}
