#' Generate Random Dummy Values
#'
#' Generate random values from a \pkg{wakefield} variable function.
#'
#' @param fun A \pkg{wakefield} variable function.
#' @param n The number of rows to produce.
#' @param \ldots Additional arguments passed to `fun`.
#' @param prefix logical.  If `TRUE` the original factor name (supplied to
#' `fun` as `name` argument) will prefix the column names that were
#' generated from the factor's categories.
#' @param rep.sep A separator to use for the variable and category part of names
#' when `prefix = TRUE`.  For example if the [wakefield::age()]
#' is used (`r_dummy(sex)`), this results in column names
#' `c("Sex_Male", "Sex_Female")`.
#' @return Returns a [dplyr::tbl_df()].
#' @keywords dummy
#' @export
#' @seealso [wakefield::r_list()],
#' [wakefield::r_data_frame()],
#' [wakefield::r_series()]
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



