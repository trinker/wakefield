#' Generate Random Dummy Values
#'
#' Generate random values from a \pkg{wakefield} variable function.
#'
#' @param fun A \pkg{wakefield} variable function.
#' @param n The number of rows to produce.
#' @param \ldots Additional arguments passed to \code{fun}.
#' @param prefix logical.  If \code{TRUE} the original factor name (supplied to
#' \code{fun} as \code{name} argument) will prefix the column names that were
#' generated from the factor's categories.
#' @param rep.sep A separator to use for the variable and category part of names
#' when \code{prefix = TRUE}.  For example if the \code{\link[wakefield]{age}}
#' is used (\code{r_dummy(sex)}), this results in column names
#' \code{c("Sex_Male", "Sex_Female")}.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @keywords dummy
#' @export
#' @seealso \code{\link[wakefield]{r_list}},
#' \code{\link[wakefield]{r_data_frame}},
#' \code{\link[wakefield]{r_series}}
#' @examples
#' r_dummy(sex, 10)
#' r_dummy(race, 1000)
#' r_dummy(race, 1000, name = "Ethnicity")
r_dummy <- function(fun, n, ..., prefix = FALSE, rep.sep = "_") {

    vect <- fun(n = n, ...)

    out <- dplyr::tbl_df(mtabulate(vect))

    if (isTRUE(prefix)) {
        names(out) <- paste(attributes(vect)[["varname"]], colnames(out),
            sep = rep.sep)
    }
    seriesname(out, attributes(vect)[["varname"]])
}



