#' Generate a Random Vector of Probabilities.
#'
#' Generate a random vector of probabilities that sum to 1.
#'
#' @param j An integer of number of probability elements (typically performs
#' best at j < 4000).
#' @param upper `probs` works by sampling from `1:upper` j times and
#' then dividing each sample by the sum of all samples.
#' @return Returns a vector of probabilities summing to 1.
#' @keywords probability percent
#' @export
#' @examples
#' probs(10)
#' sum(probs(100))
#' pie(table(month(10000, prob = probs(12))))
probs <- function(j, upper = 1000000) {
    m <- sample(1:upper, j, TRUE)
    out <- suppressWarnings(m/sum(m))
    if (anyNA(out)) stop("`j` is too large.  `j` typically performs best at < 4000")
    out
}

