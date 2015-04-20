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
#' pr <- probs(length(1995:as.numeric(format(Sys.Date(), "%Y"))))
#' pie(table(year(10000, prob = pr)))
year <- hijack(r_sample,
    name = "Year",
    x = 1995:as.numeric(format(Sys.Date(), "%Y"))
)



