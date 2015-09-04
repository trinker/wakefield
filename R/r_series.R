#' Data Frame Series (Repeated Measures)
#'
#' Produce a \code{\link[dplyr]{tbl_df}} data frame of repeated measures from a
#' wakefield variable function.
#'
#' @param fun A \pkg{wakefield} variable function.
#' @param j The number of columns to produce.
#' @param n The number of rows to produce.
#' @param \ldots Additional arguments passed to \code{fun}.
#' @param integer logical.  If \code{TRUE} factor columns will be coerced to
#' integer.
#' @param relate Allows the user to specify the relationship between columns.
#' May be a named list of \code{c("operation", "mean", "sd")} or a string of
#' the form of "fM_sd" where `f` is one of (+, -, *, /), `M` is a mean value, and
#' `sd` is a standard deviation of the mean value (e.g., \code{"*4_1"}).  See
#' \code{\link[wakefield]{relate}} for details.
#' @param rep.sep A separator to use for repeated variable names.  For example
#' if the \code{\link[wakefield]{age}} is used three times
#' (\code{r_data_frame(age, age, age)}), the name "Age" will be assigned to all
#' three columns.  The results in column names \code{c("Age_1", "Age_2", "Age_3")}.
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
#'
#' ## Related variables
#' r_series(likert, 10, 200, relate = list(operation = "*", mean = 2, sd = 1))
#' r_series(likert, 10, 200, relate = "--3_1")
#' r_series(age, 10, 200, relate = "+5_0")
#'
#' ## Change sd to reduce/increase correlation
#' round(cor(r_series(grade, 10, 10, relate = "+1_2")), 2)
#' round(cor(r_series(grade, 10, 10, relate = "+1_0")), 2)
#' round(cor(r_series(grade, 10, 10, relate = "+1_.5")), 2)
#' round(cor(r_series(grade, 10, 10, relate = "+1_20")), 2)
#'
#' ## Plot Example 1
#' library(dplyr); library(ggplot2)
#'
#' dat <- r_data_frame(12,
#'     name,
#'     r_series(likert, 10, relate = "+1_.5")
#' )
#'
#' # Suggested use of tidyr or reshape2 package here instead
#' dat <- data.frame(
#'     ID = rep(dat[[1]], ncol(dat[-1])),
#'     stack(dat[-1])
#' )
#'
#' dat[["Time"]] <- factor(sub("Variable_", "", dat[["ind"]]), levels = 1:10)
#' ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
#'     geom_line(size=.8)
#'
#' ## Plot Example 2
#' dat <- r_data_frame(12,
#'     name,
#'     r_series(grade, 100, relate = "+1_2")
#' )
#'
#' # Suggested use of tidyr or reshape2 package here instead
#' dat <- data.frame(
#'     ID = rep(dat[[1]], ncol(dat[-1])),
#'     ind = rep(colnames(dat[-1]), each = nrow(dat)),
#'     values = unlist(dat[-1])
#' )
#'
#'
#' dat[["Time"]] <- as.numeric(sub("Grade_", "", dat[["ind"]]))
#' ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
#'     geom_line(size=.8) + theme_bw()
r_series <- function(fun, j, n, ..., integer = FALSE, relate = NULL,
    rep.sep = "_") {

    if (!is.null(relate)) {
        if (is.character(relate)) {
            if (!validate_relate(relate)) {
                stop("`relate` string not valid:\n",
                    "   Use a string in the form of \"fM_sd\" where `f` is one of (+, -, *, /), `M` is a\n",
                    "   mean value, and `sd` is a standard deviation of the mean value (e.g., \"*4_1\")."
                )
            }
            relate <- stats::setNames(
                as.list(
                    strsplit(
                        gsub("^([*/+-])", "\\1_", relate), "_"
                    )[[1]]
                ), c("operation", "mean", "sd")
            )
        }

        relate[-1] <- lapply(relate[-1], as.numeric)
        if (all(!c("operation", "mean", "sd") %in% names(relate))) {
            stop("`relate` must be a named list of \"operation\", \"mean\", and \"sd\" or...\n",
                "   a string in the form of \"fM_sd\" where `f` is one of (+, -, *, /), `M` is a\n",
                "   mean value, and `sd` is a standard deviation of the mean value (e.g., \"*4_1\")."
            )
        }
        return(relate(fun(n = n, ...), j = j, mean = relate[["mean"]],
            sd = relate[["sd"]], operation = relate[["operation"]],
            rep.sep = rep.sep))
    }


    out <- lapply(seq_len(j), function(i){
        fun(n = n, ...)
    })

    names(out) <- paste(attributes(out[[1]])[["varname"]], seq_len(j),sep = rep.sep)

    out <- seriesname(dplyr::tbl_df(as.data.frame(out)), attributes(out[[1]])[["varname"]])

    if (isTRUE(integer)) out <- as_integer(out)

    out
}


