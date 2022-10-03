#' Generate Random Vector of Eye Colors
#'
#' Generate a random vector of eye colors.
#'
#' @details The eye colors and probabilities:
#'
#' \tabular{lr}{
#'   ** Color**     \tab **Percent**\cr
#'   Brown   \tab 44 %\cr
#'   Blue    \tab 30 %\cr
#'   Green   \tab 13 %\cr
#'   Hazel   \tab  9 %\cr
#'   Gray    \tab  4 %\cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of eye color elements.
#' @keywords eye iris
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' eye(10)
#' barplot(v <- table(eye(10000)), col = replace(names(v), 4, "yellowgreen"))
eye <- hijack(r_sample_factor,
    name = "Eye",
    x = c("Brown", "Blue", "Green", "Hazel", "Gray"),
    prob = c(.44, .3, .13, .09, .04)
)
