#' Generate Random Lorem Ipsum Strings
#'
#' Generates (pseudo)random \href{http://www.lipsum.com/}{\emph{lorem ipsum}}
#' text.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of \code{r_data_frame} or \code{r_list}.
#' @param \dots Other arguments passed to  \code{\link[stringi]{stri_rand_lipsum}}.
#' @param name The name to assign to the output vector's \code{varname}
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of \code{r_data_frame} or \code{r_list}.
#' @return Returns a random character vector of string elements.
#' @keywords string character
#' @export
#' @note \code{lorem_ipsum} and \code{paragraph} produce identical strings but
#' will produce different vector/column names when used inside of
#' \code{r_data_frame} or \code{r_list}.
#' @seealso \code{\link[stringi]{stri_rand_lipsum}}
#' @rdname lorem_ipsum
#' @family variable functions
#' @examples
#' lorem_ipsum(10)
#' paragraph(10)
#'
#' lorem_ipsum(10, start_lipsum = FALSE)
lorem_ipsum <- function (n, ..., name = "Lorem_Ipsum") {

    if (missing(n)) stop("`n` is missing")
    out <- stringi::stri_rand_lipsum(n=n, ...)
    varname(out, name)

}

#' @export
#' @rdname lorem_ipsum
paragraph <- function (n, ..., name = "Paragraph"){

    if (missing(n)) stop("`n` is missing")
    out <- stringi::stri_rand_lipsum(n=n, ...)
    varname(out, name)

}
