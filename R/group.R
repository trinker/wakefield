#' Generate Random Vector of Control/Treatment Groups
#'
#' Generate a random vector of binary groups (e.g., control/treatment).
#'
#' @inheritParams dummy
#' @param x A vector of groups to sample from.
#' @return Returns a random factor vector of group (control/treatment) elements.
#' @keywords group
#' @export
#' @note If you want > 2 groups see `r_sample_factor`.
#' @include utils.R r_sample_binary.R
#' @family variable functions
#' @examples
#' group(10)
#' 100*table(group(n <- 10000))/n
#' 100*table(group(n <- 10000, prob = c(.3, .7)))/n
group <- hijack(r_sample_binary_factor,
    name = "Group",
    x = c("Control", "Treatment")
)


