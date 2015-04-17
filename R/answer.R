#' Generate Random Vector of Answers (Yes/No)
#'
#' Generate a random vector of answers (yes/no).
#'
#' @inheritParams dummy
#' @param x A vector of answers to sample from.
#' @return Returns a random factor vector of answers (yes/no) outcome elements.
#' @keywords answer yes no
#' @export
#' @include utils.R r_sample_binary.R
#' @family variable functions
#' @examples
#' answer(10)
#' 100*table(answer(n <- 10000))/n
answer <- hijack(r_sample_binary_factor,
    name = "Answer",
    x = c("No", "Yes")
)
