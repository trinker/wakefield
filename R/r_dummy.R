#' Title
#'
#' Description
#'
#' @param fun A \pkg{waefield} variable function.
#' @param n The number of rows to produce.
#' @param \ldots Additional arguments passed to \code{fun}.
#' @param rep.sep A separator to use for the variable and category part of names.
#' For example if the \code{\link[wakefield]{age}} is used
#' (\code{r_dummy(sex)}), this resuts in column names \code{c("Sex_Male", "Sex_Female")}.
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
r_dummy <- function(fun, n, ..., rep.sep = "_") {

    vect <- fun(n = n, ...)

    out <- dplyr::tbl_df(mtabulate(vect))

    names(out) <- paste(attributes(vect)[["varname"]], colnames(out), sep = rep.sep)
    out
}




