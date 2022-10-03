#' Add Internal Name to Vector
#'
#' Adds the class `variable` and an internal
#' `attributes(x)[["varname"]]` attribute to a vector.
#'
#' @param x A vector to add a `varname` attribute (i.e.,
#' `attributes(x)[["varname"]]`)
#' @param name A name to assign to `attributes(x)[["varname"]]`.
#' @return Returns a vector of the class `variable` with a
#' `attributes(x)[["varname"]]` assigned.
#' @export
#' @examples
#' varname(1:10, "A")
#' attributes(varname(1:10, "A"))
#' sum(varname(1:10, "A"))
#'
#' varname(LETTERS, "Caps")
#' attributes(varname(LETTERS, "Caps"))
#' paste(varname(LETTERS, "Caps"), collapse="")
varname <-
function (x, name) {
    class(x) <- c("variable", class(x))
    attributes(x)[["varname"]] <- name
    x
}


#' Prints a variable Object
#'
#' Prints a `variable` object
#'
#' @param x The `variable` object.
#' @param \ldots Ignored.
#' @export
#' @method print variable
print.variable <- function(x, ...) {
    class(x) <- class(x)[!class(x) %in% "variable"]
    attributes(x)[["varname"]] <- NULL
    print(x)
}

