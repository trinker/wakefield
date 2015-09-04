#' Generate Random Vector of Educational Attainment Level
#'
#' Generate a random vector of educational attainment level.
#'
#' @details The educational attainments and probabilities used match approximate
#' U.S. educational attainment make-up (http://www.census.gov):
#'
#' \tabular{lr}{
#'   \bold{ Highest Attainment}        \tab \bold{Percent} \cr
#'   No Schooling Completed                   \tab 1.3 \% \cr
#'   Nursery School to 8th Grade              \tab 5 \%   \cr
#'   9th Grade to 12th Grade, No Diploma      \tab 8.5 \% \cr
#'   Regular High School Diploma              \tab 24.6 \%\cr
#'   GED or Alternative Credential            \tab 3.9 \% \cr
#'   Some College, Less than 1 Year           \tab 6.4 \% \cr
#'   Some College, 1 or More Years, No Degree \tab 15 \%  \cr
#'   Associate's Degree                       \tab 7.5 \% \cr
#'   Bachelor's Degree                        \tab 17.6 \%\cr
#'   Master's Degree                          \tab 7.2 \% \cr
#'   Professional School Degree               \tab 1.9 \% \cr
#'   Doctorate Degree                         \tab 1.2 \% \cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of educational attainment level elements.
#' @keywords education
#' @export
#' @include utils.R r_sample.R
#' @references \url{http://www.census.gov}
#' @family variable functions
#' @examples
#' education(10)
#' pie(table(education(10000)))
education <- hijack(r_sample_factor,
    name = "Education",
    x = c("No Schooling Completed", "Nursery School to 8th Grade", "9th Grade to 12th Grade, No Diploma",
        "Regular High School Diploma", "GED or Alternative Credential",
        "Some College, Less than 1 Year", "Some College, 1 or More Years, No Degree",
        "Associate's Degree", "Bachelor's Degree", "Master's Degree",
        "Professional School Degree", "Doctorate Degree"),
    prob = c(0.013, 0.05, 0.085, 0.246, 0.039, 0.064, 0.15, 0.075, 0.176,
    0.072, 0.019, 0.012)
)




