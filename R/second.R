#' Generate a Random Sequence of Seconds in H:M:S Format
#'
#' Generate a random vector of seconds in H:M:S format.
#'
#' @inheritParams r_sample_factor
#' @param random logical.  If \code{TRUE} the times are randomized, otherwise the
#' times are sequential.
#' @return Returns a random vector of second time elements in H:M:S format.
#' @keywords time second
#' @export
#' @seealso \code{\link[chron]{times}}
#' @examples
#' second(20)
#' second(20, random=TRUE)
#' pie(table(second(2000, x = seq(0, 59, by = 10)/3600, prob = probs(6))))
second <- function(n, x = seq(0, 59, by = 1)/3600, prob = NULL, random = FALSE,
    name = "Second"){

    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    if (!random) out <- sort(out)
    varname(sec2hms(out), name)

}

