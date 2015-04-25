#' Add Internal Name to Vector
#'
#' Adds the class \code{variable} and an internal
#' \code{attributes(x)[["varname"]]} attribute to a vector.
#'
#' @param x A vector to add a \code{varname} attribute (i.e.,
#' \code{attributes(x)[["varname"]]})
#' @param name A name to assign to \code{attributes(x)[["varname"]]}.
#' @return Returns a vector of the class \code{variable} with a
#' \code{attributes(x)[["varname"]]} assigned.
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
#' Prints a \code{variable} object
#'
#' @param x The \code{variable} object.
#' @param \ldots Ignored.
#' @export
#' @method print variable
print.variable <- function(x, ...) {
    class(x) <- class(x)[!class(x) %in% "variable"]
    attributes(x)[["varname"]] <- NULL
    print(x)
}

