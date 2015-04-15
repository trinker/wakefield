#' Title
#'
#' Description
#'
#' @param x A vector to add a code{varname} attribute (i.e.,
#' \code{attributes(x)[["varname"]]})
#' @param name A name to assign to \code{attributes(x)[["varname"]]}.
#' @return Returns a vector with a \code{attributes(x)[["varname"]]} assigned.
#' @export
#' @family variable.meta functions
#' @examples
#' varname(1:10, "A")
#' varname(LETTERS, "Caps")
varname <-
function (x, name) {
    attributes(x)[["varname"]] <- list(name)
    x
}

