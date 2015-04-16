#' Data Frame Production (From Variable Functions)
#'
#' Produce a \code{\link[dplyr]{tbl_df}} data frame that allows the user to
#' lazily pass unnamed \pkg{wakefield} variable functions (optionally, without
#' call parenthesis).
#'
#' @inheritParams r_list
#' @param \ldots A set of optionally named arguments.  Using \pkg{wakefield}
#' variable functions require no name or call parenthesis.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @author Josh O'Brien and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/29617983/1000343}
#' @export
#' @seealso \code{\link[wakefield]{r_list}}
#' @examples
#' r_data_frame(
#'     n = 30,
#'     d = rnorm,
#'     race,
#'     e = rnorm,
#'     p = rep("D", 30),
#'     rnorm
#' )
r_data_frame <-
function (n, ...) {
    out <- r_list(n = n, ...)
    out <- setNames(data.frame(out), names(out))
    dplyr::tbl_df(out)
}

