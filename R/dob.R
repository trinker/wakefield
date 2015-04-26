#' Generate Random Vector of Birth Dates
#'
#' Generate a random vector of birth dates.
#'
#' @inheritParams date_stamp
#' @return Returns a random vector of birth date elements.
#' @keywords birth dob
#' @export
#' @rdname dob
#' @include utils.R date_stamp.R
#' @family variable functions
#' @examples
#' dob(10)
#' barplot(table(birth(15)))
#' barplot(table(birth(30)))
dob <- function(n, random = TRUE, x = NULL, start = Sys.Date() - 365*15,
    k = 365*2, by = "1 days", prob = NULL, name = "DOB"){

    if (is.null(x)){
        x <- seq(start, length = k, by = by)
    }

    if (!inherits(x, c("Date", "POSIXct", "POSIXt"))) warning("`x`may not a date vector")

    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    if (!random) out <- sort(out)
    varname(out, name)
}



#' @export
#' @rdname dob
birth <- hijack(dob,
    name = "Birth"
)
