#' Generate Random Vector of Zip Codes
#'
#' Generate a random vector of zip codes.
#'
#' @inheritParams color
#' @return Returns a random vector of zip code elements.
#' @keywords zip_code
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' zip_code(10)
#' pie(table(zip_code(10000, prob = probs(10))))
zip_code <-
function (n, k = 10, x = 10000:99999, prob = NULL, name = "Zip") {

    stopifnot(k < length(x) || k > 0)
    if (!is.null(prob) && length(prob) != k) stop("length of `prob` must equa `k`")

    out <- sample(x = lvls <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", sample(x, k),
        perl=TRUE), size = n, replace = TRUE, prob = prob)

    varname(out, name)

}



