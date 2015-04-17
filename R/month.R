#' Generate Random Vector of Months
#'
#' Generate a random factor vector of months.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random character vector of month elements.
#' @keywords month
#' @export
#' @family variable functions
#' @examples
#' month(10)
#' pie(table(month(10000, prob = probs(12))))
month <-
function (n, x = month.name, prob = NULL, name = "month") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x)
    varname(out, name)

}


