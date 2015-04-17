#' Generate Random Vector of Ages
#'
#' Generate a random vector of ages.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of gender elements.
#' @keywords age
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' age(10)
#' hist(age(10000))
#' interval(age, 3, n = 1000)
age <- hijack(r_sample,
    name = "Age",
    x = 20:35
)

