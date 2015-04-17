#' Generate Random Letter Vector
#'
#' \code{upper} - Generates a random character vector of upper case letters.
#'
#' @inheritParams r_sample_factor
#' @param k The number of the elements of x to sample from (uses 1:k).
#' @return Returns a random character/factor vector of letter elements.
#' @keywords letters upper lower capitals
#' @export
#' @include utils.R upper.R
#' @rdname letter
#' @family variable functions
#' @examples
#' upper(10)
#' lower(10)
#' upper_factor(10)
#' lower_factor(10)
#' barplot(table(upper(10000)))
upper <- function(n, k = 5, x = LETTERS, prob = NULL, name = "Upper"){

    stopifnot(k < length(x) || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = x[seq_len(k)], size = n, replace = TRUE, prob = prob)
    varname(out, name)

}


#' Generate Random Letter Vector
#'
#' \code{lower} - Generates a random character vector of lower case letters.
#'
#' @export
#' @rdname letter
lower <- hijack(upper,
    x = letters,
    name = "Lower"
)

#' Generate Random Letter Vector
#'
#' \code{upper_factor} - Generates a random factor vector of upper case letters.
#'
#' @export
#' @rdname letter
upper_factor <- function(n, k = 5, x = LETTERS, prob = NULL, name = "Upper"){

    stopifnot(k < length(x) || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = x[seq_len(k)], size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x[seq_len(k)])
    varname(out, name)

}


#' Generate Random Letter Vector
#'
#' \code{lower_factor} - Generates a random factor vector of lower case letters.
#'
#' @export
#' @rdname letter
lower_factor <- hijack(upper_factor,
    x = letters,
    name = "Lower"
)
