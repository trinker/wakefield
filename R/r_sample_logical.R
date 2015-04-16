#' Generate Random Logical Vector
#'
#' Generate a random logical (\code{TRUE}/\code{FALSE}) vector.
#'
#' @inheritParams r_sample_binary
#' @return Returns a random logical (\code{TRUE}/\code{FALSE}) vector of elements.
#' @seealso \code{\link[base]{sample}}
#' @export
#' @examples
#' r_sample_logical(100, name = "Var")
#' table(r_sample_logical(1000))
#' c("B", "W")[r_sample_logical(10)]
r_sample_logical <-
function (n, prob = NULL, name = "Logical") {

    if (missing(n)) stop("`n` is missing")
    out <- as.logical(sample.int(n = 2, size = n, replace = TRUE, prob = prob) - 1)
    varname(out, name)

}

