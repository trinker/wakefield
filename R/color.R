#' Generate Random Vector of Colors
#'
#' `color` - Generate a random vector of colors (sampled from `colors()`).
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param k The number of the elements of x to sample from (uses `sample(x, k)`).
#' @param x A vector of elements to chose from.
#' @param prob A vector of probabilities to chose from.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random factor vector of color elements.
#' @keywords color
#' @export
#' @rdname color
#' @include utils.R r_sample_factor.R
#' @family variable functions
#' @examples
#' color(10)
#' pie(tab <- table(color(10000)), col = names(tab))
#'
#' primary(10)
#' pie(tab <- table(primary(10000)), col = names(tab))
#' barplot(tab <- table(primary(10000, prob = probs(6))), col = names(tab))
color <- function(n, k = 10, x = grDevices::colors(), prob = NULL, name = "Color"){

    stopifnot(k < length(x) || k > 0)
    if (!is.null(prob) && length(prob) != k) stop("length of `prob` must equa `k`")

    out <- sample(x = lvls <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", sample(x, k),
        perl=TRUE), size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = lvls)
    varname(out, name)

}

#' Generate Random Vector of Colors
#'
#' `color` - Generate a random vector of *psycological primary*
#' colors (sampled from `colors()`).
#'
#' @export
#' @rdname color
primary <- hijack(r_sample_factor,
    name = "Color",
    x = c("Red", "Green", "Blue", "Yellow", "Black", "White")
)




