#' Create Related Numeric Columns
#'
#' Generate coumns that are related.
#'
#' @param x A starting column.
#' @param j The number of columns to produce.
#' @param name An optional prefix name to give to the columns.  If \code{NULL}
#' attepts to take from the \code{varname} attribute of \code{x}.  If not found,
#' "Variable" is used.
#' @param operation A operation character vector of length 1; either
#' \code{c("+", "-", "*", "/")}.  This is the relationship between columns.
#' @param mean Mean is the average vaule to add, subtract, multiple, or divide
#' by.
#' @param sd The amount of variability to allow in \code{mean}.  Setting to 0
#' will constrain the operation between x_(n - 1) column and x_n to be exactly
#' the mean value (see \bold{Examples} for a demonstration).
#' @param rep.sep A separator to use for repeated variable names.  For example
#' if the \code{\link[wakefield]{age}} is used three times
#' (\code{r_data_frame(age, age, age)}), the name "Age" will be assigned to all
#' three columns.  The resuts in column names \code{c("Age_1", "Age_2", "Age_3")}.
#' @param digits The number of digits to round to.  Defaults to the max number
#' of significant digits in \code{x}.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @keywords correlate related
#' @export
#' @seealso \code{\link[wakefield]{r_series}}
#' @examples
#' relate(1:10, 10)
#'
#' (x <- r_data_frame(10, id, relate(1:10, 10, "Time", mean = 2)))
#' library(ggplot2)
#'
#' dat <- with(x, data.frame(ID = rep(ID, ncol(x[, -1])), stack(x[, -1])))
#' dat[["Time"]] <- factor(sub("Time_", "", dat[["ind"]]), levels = 1:10)
#' ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
#'     geom_line(size=.8)
#'
#' relate(1:10, 10, name = "X", operation = "-")
#' relate(1:10, 10, "X", mean = 1, sd = 0)
#' relate(1:10, 10, "Var", "*")
#' relate(1:10, 10, "Var", "/")
#'
#' relate(gpa(30), 5, mean = .1)
#' relate(likert(10), 5, mean = .1, sd = .2)
#' relate(date_stamp(10), 6)
#' relate(time_stamp(10), 6)
#' relate(rep(100, 10), 6, "Reaction", "-")
relate <- function(x, j, name = NULL, operation = "+", mean = 5, sd = 1,
    rep.sep = "_", digits = max(nchar(sub("^[^.]*.", "", x)))){

    if (is.factor(x) | inherits(x, c("Date", "POSIXct", "POSIXt"))) x <- as.numeric(x)
    if (!is.numeric(x)) warning("`x` is not numeric, date, or factor.", immediate. = TRUE)

    elems <- (j - 1) * length(x)

    seed_dat <- data.frame(x, matrix(rnorm(elems, mean = mean, sd = sd),
        nrow = length(x)), stringsAsFactors = FALSE)

    if (!is.null(digits)) seed_dat <- round(seed_dat, digits)

    for (i in 2:ncol(seed_dat)) {
        seed_dat[, i] <- match.fun(operation)(seed_dat[, i - 1], seed_dat[, i])
    }

    if (is.null(name)) name <- attributes(x)[["varname"]]
    if (is.null(name)) name <- "Variable"

    out <- setNames(seed_dat, paste(name, seq_len(j), sep = rep.sep))

    seriesname(dplyr::tbl_df(out), name)
}

