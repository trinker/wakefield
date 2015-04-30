#' Generate Random Vector of Levels
#'
#' \code{level} - Generate a random vector of integer levels (1-4).
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of integer levels (1-4) elements.
#' @keywords level
#' @export
#' @rdname level
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' level(10)
#' barplot(table(level(10000, prob = probs(4))))
#'
#' math(10)
#' barplot(table(math(10000)))
#'
#' ela(10)
#' barplot(table(ela(10000)))
level <- hijack(r_sample,
    name = "Level",
    x = 1:4
)

#' Generate Random Vector of Levels
#'
#' \code{math} - Generate a random vector of integer mathematics levels (1-4)
#' similar to New York State grades 3-8 assessment results.
#'
#' @details Distribution of levels (used in \code{prob}) were taken from New
#' York State' s 2014 assessment report: \url{http://www.p12.nysed.gov/irs/}
#'
#' \tabular{lrr}{
#'   \bold{ Level}   \tab \bold{ELA}  \tab \bold{Math}\cr
#'   1 \tab 31.6\% \tab 29.8\%\cr
#'   2 \tab 37.3\% \tab 33.3\%\cr
#'   3 \tab 22.3\% \tab 22.8\%\cr
#'   4 \tab 8.8\%  \tab 14.0\%\cr
#' }
#'
#' @export
#' @rdname level
math <- hijack(r_sample,
    name = "Math",
    x = 1:4,
    prob = c(0.29829, 0.33332, 0.22797, 0.14042)
)

#' Generate Random Vector of Levels
#'
#' \code{math} - Generate a random vector of integer English language arts (ELA)
#' levels (1-4) similar to New York State grades 3-8 assessment results.
#'
#' @export
#' @rdname level
ela <- hijack(r_sample,
    name = "ELA",
    x = 1:4,
    prob = c(0.3161, 0.37257, 0.2233, 0.08803)
)


