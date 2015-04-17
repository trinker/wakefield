#' Generate Random Vector of Dice Throws
#'
#' Generate a random vector of dice throws.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of dice throw elements.
#' @keywords dice
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' dice(10)
#' barplot(table(dice(10000)))
dice <- hijack(r_sample,
    name = "Dice",
    x = 1:6
)

