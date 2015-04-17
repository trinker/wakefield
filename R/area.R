#' Generate Random Vector of Areas
#'
#' Generate a random vector of areas ("Suburban", "Urban", "Rural").
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of area status elements.
#' @keywords area
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' area(10)
#' barplot(table(area(10000)))
area <- hijack(r_sample,
    name = "Area",
    x = c("Suburban", "Urban", "Rural")
)


