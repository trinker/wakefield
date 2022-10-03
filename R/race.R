#' Generate Random Vector of Races
#'
#' Generate a random vector of races.
#'
#' @details The races and probabilities used match approximate U.S. racial
#' make-up.  The default make up is:
#'
#' \tabular{lr}{
#'   **Race**     \tab **Percent**\cr
#'   White     \tab 63.70 %\cr
#'   Hispanic  \tab 16.30 %\cr
#'   Black     \tab 12.20 %\cr
#'   Asian     \tab 4.70 %\cr
#'   Bi-Racial \tab 1.90 %\cr
#'   Native    \tab .70 %\cr
#'   Other     \tab .20 %\cr
#'   Hawaiian  \tab .15 %\cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of elements.
#' @keywords race
#' @export
#' @include utils.R r_sample_factor.R
#' @family variable functions
#' @examples
#' race(10)
#' 100*table(race(n <- 10000))/n
race <- hijack(r_sample_factor,
    name = "Race",
    x = c("White", "Hispanic", "Black", "Asian", "Bi-Racial", "Native", "Other",
        "Hawaiian"),
    prob = c(0.637, 0.163, 0.122, 0.047, 0.019, 0.007, 0.002, 0.0015)
)
