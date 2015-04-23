#' Generate Random Vector of Empoyment Statuses
#'
#' Generate a random vector of empoyment statuses.
#'
#' @inheritParams r_sample_factor
#' @details The folowing arbitraty probabilities are used:
#'
#' \tabular{lr}{
#'   \bold{ Employment Status}  \tab \bold{Percent}\cr
#'   Full Time  \tab 60\%\cr
#'   Part Time  \tab 10\%\cr
#'   Unemployed \tab 10\%\cr
#'   Retired    \tab 10\%\cr
#'   Student    \tab 10\%\cr
#' }
#'
#' @return Returns a random vector of empoyment status elements.
#' @keywords empoyment
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' empoyment(10)
#' pie(table(empoyment(10000)))
#' barplot(table(empoyment(10000)))
empoyment <- hijack(r_sample,
    name = "Empoyment",
    prob = c(.6, .1, .1, .1, .1),
    x = c("Full Time", "Part Time", "Unemployed", "Retired", "Student")
)

