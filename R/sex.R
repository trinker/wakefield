#' Generate Random Vector of Genders
#'
#' Generate a random vector of genders.
#'
#' @details The genders and probabilities used match approximate gender
#' make-up:
#'
#' \tabular{lr}{
#'   \bold{Gender}     \tab \bold{Percent}\cr
#'   Male    \tab 51.22 \%\cr
#'   Female \tab 48.78 \%
#' }
#'
#' @inheritParams r_sample_binary_factor
#' @return Returns a random factor vector of gender elements.
#' @keywords sex gender
#' @export
#' @include utils.R r_sample_binary.R
#' @family variable functions
#' @examples
#' sex(10)
#' 100*table(sex(n <- 10000))/n
sex <- hijack(r_sample_binary_factor,
    name = "Sex",
    x = c("Male", "Female"),
    prob = (x <- c(105, 100))/sum(x)
)


