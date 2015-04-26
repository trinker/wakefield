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
dob <- hijack(date_stamp,
    name = "DOB",
    random = TRUE,
    start = Sys.Date() - 365*15,
    k = 2*365,
    by = "1 days"
)


#' @export
#' @rdname dob
birth <- hijack(dob,
    name = "Birth"
)
