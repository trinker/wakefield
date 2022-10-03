#' Generate a Random Sequence of Times in H:M:S Format
#'
#' Generate a random vector of times in H:M:S format.
#'
#' @inheritParams r_sample_factor
#' @param random logical.  If `TRUE` the times are randomized, otherwise the
#' times are sequential.
#' @return Returns a random vector of time elements in H:M:S format.
#' @keywords time
#' @export
#' @seealso [chron::times()]
#' @examples
#' time_stamp(20)
#' time_stamp(20, random=TRUE)
#' pie(table(time_stamp(2000, x = seq(0, 23, by = 2), prob = probs(12))))
time_stamp <- function(n, x = seq(0, 23, by = 1), prob = NULL, random = FALSE,
    name = "Time"){

    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    if (!random) out <- sort(out)
    varname(sec2hms(out), name)

}


