#' Generate Random Vector of Coin Flips
#'
#' Generate a random vector of coin fips (heads/tails).
#'
#' @inheritParams dummy
#' @param x A vector of coin outcomes to sample from.
#' @return Returns a random factor vector of coin flip outcome elements.
#' @keywords coin head tail
#' @export
#' @include utils.R r_sample_binary.R
#' @family variable functions
#' @examples
#' coin(10)
#' 100*table(coin(n <- 10000))/n
coin <- hijack(r_sample_binary_factor,
    name = "Coin",
    x = c("Tails", "Heads")
)
