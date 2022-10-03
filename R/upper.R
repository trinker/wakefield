#' Generate Random Letter Vector
#'
#' `upper` - Generates a random character vector of upper case letters.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param k The number of the elements of x to sample from (uses 1:k).
#' @param x A vector of elements to chose from.
#' @param prob A vector of probabilities to chose from.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
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
#' barplot(table(upper(10000, prob = probs(5))))
upper <- function(n, k = 5, x = LETTERS, prob = NULL, name = "Upper"){

    stopifnot(k < length(x) || k > 0)
    if (!is.null(prob) && length(prob) != k) stop("length of `prob` must equa `k`")

    out <- sample(x = x[seq_len(k)], size = n, replace = TRUE, prob = prob)
    varname(out, name)

}


#' Generate Random Letter Vector
#'
#' `lower` - Generates a random character vector of lower case letters.
#'
#' @export
#' @rdname letter
lower <- hijack(upper,
    x = letters,
    name = "Lower"
)

#' Generate Random Letter Vector
#'
#' `upper_factor` - Generates a random factor vector of upper case letters.
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
#' `lower_factor` - Generates a random factor vector of lower case letters.
#'
#' @export
#' @rdname letter
lower_factor <- hijack(upper_factor,
    x = letters,
    name = "Lower"
)
