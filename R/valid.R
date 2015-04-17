#' Generate Random Logical Vector
#'
#' Generate a random logical (\code{TRUE}/\code{FALSE}).
#'
#' @inheritParams r_sample_logical
#' @return Returns a random logical vector of elements.
#' @keywords logical valid true false
#' @export
#' @include utils.R r_sample_logical.R
#' @family variable functions
#' @examples
#' valid(10)
#' 100*table(valid(n <- 1000))/n
valid <- hijack(r_sample_logical,
    name = "Valid"
)
