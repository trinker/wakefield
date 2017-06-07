#' Generate Random Vector of Non-Binary Genders
#'
#' Generate a random vector of non-binary genders. Proportion of trans*
#' category was taken from the Williams Institute report (2011), and
#' subtracted equally from the male and female categories.
#'
#' @details The genders and probabilities used match approximate gender
#' make-up:
#'
#' \tabular{lr}{
#'   \bold{Gender}     \tab \bold{Percent}\cr
#'   Male    \tab 51.07 \%\cr
#'   Female  \tab 48.63 \%\cr
#'   Trans*  \tab 0.30 \%\cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of sex or gender elements.
#' @keywords sex gender
#' @export
#' @rdname sexNB
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' sexNB(10)
#' barplot(table(sexNB(10000)))
sexNB <- hijack(r_sample_factor,
                  name = "Sex",
                  x = c("Male", "Female", "Intersex")
)

#' @export
#' @rdname sexNB
genderNB <- hijack(r_sample_factor,
                name = "Gender",
                x = c("Male", "Female", "Trans*")
)
