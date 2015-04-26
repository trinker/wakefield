#' Generate Random Vector of Marital Statuses
#'
#' Generate a random vector of marital statuses.
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of marital status elements.
#' @keywords marital married divorce widow
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' marital(10)
#' barplot(table(marital(10000)))
marital <- hijack(r_sample_factor,
    name = "Marital",
    x = c("Married", "Divorced", "Widowed", "Separated", "Never Married")
)


