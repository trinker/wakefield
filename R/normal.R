#' Generate Random Normal Vector
#'
#' \code{normal} - A wrapper for \code{\link[stats]{rnorm}} that generate a
#' random normal vector.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of \code{r_data_frame} or \code{r_list}.
#' @param mean The mean value for the normal distribution to be drawn from.
#' @param sd The standard deviation of the normal distribution to draw from.
#' @param min A numeric lower boundary cutoff.  Resuts less than this value will be
#' replaced with \code{min}.
#' @param max A numeric upper boundary cutoff.  Resuts greater than this value will
#' be replaced with \code{max}.
#' @param name The name to assign to the output vector's \code{varname}
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of \code{r_data_frame} or \code{r_list}.
#' @return Returns a random vector of elements.
#' @keywords normal
#' @seealso \code{\link[stats]{rnorm}}
#' @family variable functions
#' @export
#' @rdname normal
#' @examples
#' normal(100, name = "Var")
#' hist(normal(10000, 100, 10))
#' interval(normal, 9, n = 1000)
normal <-
function (n, mean = 0, sd = 1, min = NULL, max = NULL, name = "Normal") {

    if (missing(n)) stop("`n` is missing")
    out <- rnorm(n = n, mean = mean, sd = sd)

    if (!is.null(min)){
        out[out < min] <- min
    }

    if (!is.null(max)){
        out[out > max] <- max
    }

    varname(out, name)

}

#' Generate Random Normal Vector
#'
#' \code{normal_round} - A wrapper for \code{\link[stats]{rnorm}} that generate
#' a roounded random normal vector.
#'
#' @param digits Integer indicating the number of decimal places to be used.
#' Negative values are allowed (see \code{\link[base]{round}}).
#' @seealso \code{\link[base]{round}}
#' @export
#' @rdname normal
normal_round <-
function (n, mean = 0, sd = 1, min = NULL, max = NULL, digits = 2,
    name = "Normal") {

    if (missing(n)) stop("`n` is missing")
    out <- round(rnorm(n = n, mean = mean, sd = sd), digits = digits)

    if (!is.null(min)){
        out[out < min] <- min
    }

    if (!is.null(max)){
        out[out > max] <- max
    }

    varname(out, name)

}
