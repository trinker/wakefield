#' Generate Random Vector of Levels
#'
#' Generate a random vector of integer levels (1-4).
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of integer levels (1-4) elements.
#' @keywords level
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' level(10)
#' barplot(table(level(10000, prob = probs(4))))
level <- hijack(r_sample,
    name = "Level",
    x = 1:4
)


