#' Generate Random Vector of Hair Colors
#'
#' Generate a random vector of hair colors.
#'
#' @details The hair colors and probabilities:
#'
#' \tabular{lr}{
#'   ** Color**     \tab **Percent**\cr
#'   Brown   \tab 35 %\cr
#'   Black   \tab 28 %\cr
#'   Blonde  \tab 26 %\cr
#'   Red     \tab 11 %\cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of hair color elements.
#' @keywords hair
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' hair(10)
#' v <- table(hair(10000))
#' lbs <- paste0(names(v), "\n", round(100*v/sum(v), 1), "%")
#' pie(v, col = replace(names(v), 3, "yellow"), labels = lbs)
hair <- hijack(r_sample_factor,
    name = "Hair",
    x = c("Brown", "Black", "Blonde", "Red"),
    prob = c(.35, .28, .26, .11)
)
