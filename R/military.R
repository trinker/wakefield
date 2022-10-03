#' Generate Random Vector of Military Branches
#'
#' Generate a random vector of military branches.
#'
#' @details The military branches and probabilities used match approximate U.S.
#' military make-up:
#'
#' \tabular{lrr}{
#'   ** Branch** \tab **N** \tab **Percent** \cr
#'   Army         \tab 541,291 \tab 37.9%\cr
#'   Air Force    \tab 333,772 \tab 23.3%\cr
#'   Navy         \tab 317,237 \tab 22.2%\cr
#'   Marine Corps \tab 195,338 \tab 13.7%\cr
#'   Coast Guard  \tab 42,357  \tab 3.0%\cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of military branch elements.
#' @keywords military branch marines army navy
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' military(10)
#' barplot(table(military(10000)))
#' pie(table(military(10000)))
military <- hijack(r_sample_factor,
    name = "Military",
    x = c("Army", "Air Force", "Navy", "Marine Corps", "Coast Guard"),
    prob = c(0.3785, 0.2334, 0.2218, 0.1366, 0.0296)
)
