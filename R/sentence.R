#' Generate Random Vector of Sentences
#'
#' Generate a random vector of sentences from the
#' [wakefield::presidential_debates_2012()].
#'
#' @inheritParams r_sample_factor
#' @return Returns a random character vector of sentence elements.
#' @keywords sentence
#' @export
#' @family variable functions
#' @examples
#' sentence(10)
sentence <-
function (n, x = wakefield::presidential_debates_2012, prob = NULL, name = "Sentence") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    varname(out, name)

}
