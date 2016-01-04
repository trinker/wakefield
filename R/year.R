#' Generate Random Vector of Years
#'
#' Generate a random vector of years.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of year elements.
#' @keywords year
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' year(10)
#' pr <- probs(length(1996:2016))
#' pie(table(year(10000, x= 1996:2016, prob = pr)))
year <-function (n, x = 1996:as.numeric(format(Sys.Date(), "%Y")), prob = NULL,
    name = "Year") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    varname(out, name)

}



