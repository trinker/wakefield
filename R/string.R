#' Generate Random Vector of Strings
#'
#' Generate a random vector of strings.
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param x A character vector specifying character classes to draw elements
#' from.
#' @param length Integer vector, desired string lengths.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random character vector of string elements.
#' @keywords string character
#' @export
#' @seealso [stringi::stri_rand_strings()]
#' @family variable functions
#' @examples
#' string(10)
string <- function (n, x = "[A-Za-z0-9]", length = 10, name = "String") {

    if (missing(n)) stop("`n` is missing")
    out <- stringi::stri_rand_strings(n=n, length = length, pattern=x)
    varname(out, name)

}


