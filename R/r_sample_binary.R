#' Generate Random Binary Vector
#'
#' `r_sample_binary` - Generate a random binary vector.
#'
#' @inheritParams dummy
#' @param x A vector of length 2 to sample from.
#' @return Returns a random binary vector of elements.
#' @seealso [base::sample.int()]
#' @export
#' @rdname r_sample_binary
#' @examples
#' r_sample_binary(100, name = "Var")
#' table(r_sample_binary(1000))
#' c("B", "W")[r_sample_binary(10)]
r_sample_binary <-
function (n, x = 1:2, prob = NULL, name = "Binary") {

    if (missing(n)) stop("`n` is missing")
    out <- x[sample.int(n = 2, size = n, replace = TRUE, prob = prob)]
    varname(out, name)

}

#' Generate Random Binary Vector
#'
#' `r_sample_binary_factor` - Generate a random binary vector and coerces
#' to a factor.
#'
#' @export
#' @rdname r_sample_binary
r_sample_binary_factor <-
function (n, x = 1:2, prob = NULL, name = "Binary") {

    if (missing(n)) stop("`n` is missing")
    out <- x[sample.int(n = 2, size = n, replace = TRUE, prob = prob)]
    out <- factor(out, levels = x)
    varname(out, name)

}

