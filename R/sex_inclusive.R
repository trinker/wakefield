#' Generate Random Vector of Non-Binary Genders
#'
#' Generate a random vector of non-binary genders. Proportion of trans*
#' category was taken from the
#' \href{http://williamsinstitute.law.ucla.edu/}{Williams Institute Report} (2011),
#' and subtracted equally from the male and female categories.
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
#' @author Matthew Sigal <msigal@@yorku.ca>
#' @rdname sex_inclusive
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' sex_inclusive(10)
#' barplot(table(sex_inclusive(10000)))
#'
#' gender_inclusive(10)
#' barplot(table(gender_inclusive(10000)))
sex_inclusive <- hijack(r_sample_factor,
                  name = "Sex",
                  x = c("Male", "Female", "Intersex")
)

#' @export
#' @rdname sex_inclusive
gender_inclusive <- hijack(r_sample_factor,
                name = "Gender",
                x = c("Male", "Female", "Trans*")
)
