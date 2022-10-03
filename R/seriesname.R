#' Add Internal Name to Data Frame
#'
#' Adds `attributes(x)[["seriesname"]]` attribute to a
#' [base::data.frame()].
#'
#' @param x A [base::data.frame()] to add a `seriesname`
#' attribute (i.e., `attributes(x)[["seriesname"]]`)
#' @param name A name to assign to `attributes(x)[["seriesname"]]`.
#' @return Returns a [base::data.frame()] with a
#' `attributes(x)[["seriesname"]]` assigned.
#' @export
#' @examples
#' seriesname(mtcars, "Cars")
#' attributes(seriesname(mtcars, "Cars"))
seriesname <-
function (x, name) {
    attributes(x)[["seriesname"]] <- name
    attributes(x)[["cname"]] <- colnames(x)
    x
}
