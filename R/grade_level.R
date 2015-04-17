#' Generate Random Vector of Grade Levels
#'
#' Generate a random vector of grade levels.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of grade level elements.
#' @keywords grade
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' grade_level(10)
#' barplot(table(grade_level(10000)))
grade_level <- hijack(r_sample,
    name = "Grade_Level",
    x = c("K", 1:12)
)
