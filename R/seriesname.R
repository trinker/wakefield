#' Add Internal Name to Data Frame
#'
#' Adds \code{attributes(x)[["seriesname"]]} attribute to a
#' \code{\link[base]{data.frame}}.
#'
#' @param x A \code{\link[base]{data.frame}} to add a \code{seriesname}
#' attribute (i.e., \code{attributes(x)[["seriesname"]]})
#' @param name A name to assign to \code{attributes(x)[["seriesname"]]}.
#' @return Returns a \code{\link[base]{data.frame}} with a
#' \code{attributes(x)[["seriesname"]]} assigned.
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
