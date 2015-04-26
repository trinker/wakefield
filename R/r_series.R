#' Data Frame Series (Repeated Measures)
#'
#' Produce a \code{\link[dplyr]{tbl_df}} data frame of repeated measures from a
#' wakefield variable function.
#'
#' @param fun A \pkg{waefield} variable function.
#' @param j The number of columns to produce.
#' @param n The number of rows to produce.
#' @param \ldots Additional arguments passed to \code{fun}.
#' @param integer logical.  If \code{TRUE} factor columns will be coerced to
#' integer.
#' @param rep.sep A separator to use for repeated variable names.  For example
#' if the \code{\link[wakefield]{age}} is used three times
#' (\code{r_data_frame(age, age, age)}), the name "Age" will be assigned to all
#' three columns.  The resuts in column names \code{c("Age_1", "Age_2", "Age_3")}.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @references \url{https://github.com/trinker/wakefield/issues/1/#issuecomment-96166910}
#' @export
#' @seealso \code{\link[wakefield]{r_list}},
#' \code{\link[wakefield]{r_data_frame}}
#' \code{\link[wakefield]{r_dummy}}
#' @examples
#' r_series(grade, 5, 10)
#'
#' ## Custom name prefix
#' r_series(likert, 5, 10, name = "Question")
#'
#' ## Convert factors to integers
#' r_series(likert_7, 5, 10, integer = TRUE)
r_series <- function(fun, j, n, ..., integer = FALSE, rep.sep = "_") {

    out <- lapply(seq_len(j), function(i){
        fun(n = n, ...)
    })

    names(out) <- paste(attributes(out[[1]])[["varname"]], seq_len(j),sep = rep.sep)

    out <- seriesname(dplyr::tbl_df(as.data.frame(out)), attributes(out[[1]])[["varname"]])

    if (isTRUE(integer)) out <- as_integer(out)

    out
}

