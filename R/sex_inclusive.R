#' Generate Random Vector of Non-Binary Genders
#'
#' Generate a random vector of non-binary genders. Proportion of trans*
#' category was taken from the
#' \href{https://williamsinstitute.law.ucla.edu/}{Williams Institute Report} (2011),
#' and subtracted equally from the male and female categories.
#'
#' @details The genders and probabilities used match approximate gender
#' make-up:
#'
#' \tabular{lr}{
#'   \bold{Gender}     \tab \bold{Percent}\cr
#'   Male    \tab 50.37 \%\cr
#'   Female  \tab 47.93 \%\cr
#'   Trans*  \tab 2 \%\cr
#' }
#' 
#' \tabular{lr}{
#'   \bold{Gender}     \tab \bold{Percent}\cr
#'   Male    \tab 50.52 \%\cr
#'   Female  \tab 48.08 \%\cr
#'   Intersex  \tab 1.7 \%\cr
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
                  x = c("Male", "Female", "Intersex"),
                  prob = c(0.5052, 0.4808, 0.017)
)

#' @export
#' @rdname sex_inclusive
gender_inclusive <- hijack(r_sample_factor,
                name = "Gender",
                x = c("Male", "Female", "Trans*"),
                prob = c(0.5037, 0.4793, 0.02)
)
