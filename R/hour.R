#' Generate a Random Sequence of H:M:S Times
#'
#' Generate a random vector of H:M:S times.
#'
#' @inheritParams r_sample_factor
#' @param random logical.  If \code{TRUE} the times are randomized, otherwise the
#' times are sequential.
#' @return Returns a random vector of H:M:S time elements.
#' @keywords time hour
#' @export
#' @seealso \code{\link[chron]{times}}
#' @examples
#' hour(20)
#' hour(20, random=TRUE)
hour <- function(n, x = seq(0, 23.5, by = .5), prob = NULL, random = FALSE,
    name = "Hour"){

    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    if (!random) out <- sort(out)
    varname(sec2hms(out), name)

}
