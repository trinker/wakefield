#' Data Frame Production (From Variable Functions)
#'
#' Produce a \code{\link[dplyr]{tbl_df}} data frame that allows the user to
#' lazily pass unnamed \pkg{wakefield} variable functions (optionally, without
#' call parenthesis).
#'
#' @inheritParams r_list
#' @param \ldots A set of optionally named arguments.  Using \pkg{wakefield}
#' variable functions require no name or call parenthesis.
#' @param rep.sep A separator to use for repeated variable names.  For example
#' if the \code{\link[wakefield]{age}} is used three times
#' (\code{r_data_frame(age, age, age)}), the name "Age" will be assigned to all
#' three columns.  The resuts in column names \code{c("Age_1", "Age_2", "Age_3")}.
#' To turn of this behavior use  \code{rep.sep = NULL}.  This resuts in
#' \code{c("Age", "Age.1", "Age.2")} column names in the
#' \code{\link[base]{data.frame}}.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @author Josh O'Brien and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/29617983/1000343}
#' @export
#' @seealso \code{\link[wakefield]{r_list}},
#' \code{\link[wakefield]{r_series}}
#' \code{\link[wakefield]{r_dummy}}
#' @examples
#' r_data_frame(n = 30,
#'     id,
#'     race,
#'     age,
#'     sex,
#'     hour,
#'     iq,
#'     height,
#'     died,
#'     Scoring = rnorm,
#'     Smoker = valid
#' )
#'
#' r_data_frame(n = 30,
#'     id,
#'     race,
#'     age(x = 8:14),
#'     Gender = sex,
#'     Time = hour,
#'     iq,
#'     grade, grade, grade,  #repeated measures
#'     height(mean=50, sd = 10),
#'     died,
#'     Scoring = rnorm,
#'     Smoker = valid
#' )
#'
#' r_data_frame(n = 500,
#'     id,
#'     age, age, age,
#'     grade, grade, grade
#' )
#'
#' ## Repeated Measures/Time Series
#' r_data_frame(n=100,
#'     id,
#'     age,
#'     sex,
#'     r_series(likert, 3),
#'     r_series(likert, 4, name = "Item", integer = TRUE)
#' )
#'
#' ## Expanded Dummy Coded Variables
#' r_data_frame(n=100,
#'     id,
#'     age,
#'     r_dummy(sex, prefix=TRUE),
#'     r_dummy(political)
#' )
#'
#' ## `peek` to view al columns
#' ## `plot` (`table_heat`) for a graphic representation
#' library(dplyr)
#' r_data_frame(n=100,
#'     id,
#'     dob,
#'     animal,
#'     grade, grade,
#'     death,
#'     dummy,
#'     grade_letter,
#'     gender,
#'     paragraph,
#'     sentence
#' ) %>%
#'    r_na() %>%
#'    peek %>%
#'    plot(palette = "Set1")
r_data_frame <-
function (n, ..., rep.sep = "_") {
    out <- r_list(n = n, ..., rep.sep = "_")

    ## Search for series names to use
    cnames <- sapply(out, function(x) attributes(x)[["cname"]])
    nms <- as.list(names(out))
    nms[!sapply(cnames, is.null)] <- cnames[!sapply(cnames, is.null)]

    ## If duplicate names exist fix their suffix
    if (!is.null(rep.sep)){
        nms <- ave(unlist(nms), unlist(nms), FUN = function(x) {
            if (length(x) == 1) {x} else {paste(x, seq_along(x), sep = rep.sep)}
        })
    }

    out <- setNames(data.frame(out, stringsAsFactors = FALSE,
        check.names = FALSE), unlist(nms))
    dplyr::tbl_df(out)
}

