#' Generate Random Logical Smokes Vector
#'
#' Generate a random logical (`TRUE`/`FALSE`) smokes vector.
#'
#' @inheritParams r_sample_logical
#' @details The probabilities are non-smoker: 82.2% vs. smoker: 17.8%.
#' @return Returns a random logical vector of smokes elements.
#' @keywords smoking
#' @export
#' @include utils.R r_sample_logical.R
#' @family variable functions
#' @examples
#' smokes(10)
#' 100*table(smokes(n <- 1000))/n
smokes <- hijack(r_sample_logical,
    name = "Smokes",
    prob = c(.822, .178)
)
