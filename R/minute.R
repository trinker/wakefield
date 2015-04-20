#' Generate a Random Sequence of Minutes in H:M:S Format
#'
#' Generate a random vector of minutes in H:M:S format.
#'
#' @inheritParams r_sample_factor
#' @param random logical.  If \code{TRUE} the times are randomized, otherwise the
#' times are sequential.
#' @return Returns a random vector of minute time elements in H:M:S format.
#' @keywords time minute
#' @export
#' @seealso \code{\link[chron]{times}}
#' @examples
#' minute(20)
#' minute(20, random=TRUE)
#' pie(table(minute(2000, x = seq(0, 59, by = 10)/60, prob = probs(6))))
minute <- function(n, x = seq(0, 59, by = 1)/60, prob = NULL, random = FALSE,
    name = "Minute"){

    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    if (!random) out <- sort(out)
    varname(sec2hms(out), name)

}

