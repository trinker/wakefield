#' Generate Random Vector of Employment Statuses
#'
#' Generate a random vector of employment statuses.
#'
#' @inheritParams r_sample_factor
#' @details The following arbitrary probabilities are used:
#'
#' \tabular{lr}{
#'   ** Employment Status**  \tab **Percent**\cr
#'   Full Time  \tab 60%\cr
#'   Part Time  \tab 10%\cr
#'   Unemployed \tab 10%\cr
#'   Retired    \tab 10%\cr
#'   Student    \tab 10%\cr
#' }
#'
#' @return Returns a random vector of employment status elements.
#' @keywords employment
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' employment(10)
#' pie(table(employment(10000)))
#' barplot(table(employment(10000)))
employment <- hijack(r_sample_factor,
    name = "Employment",
    prob = c(.6, .1, .1, .1, .1),
    x = c("Full Time", "Part Time", "Unemployed", "Retired", "Student")
)

