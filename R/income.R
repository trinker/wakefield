#' Generate Random Gamma Vector of Incomes
#'
#' Generate a random gamma vector of incomes.
#'
#' @details Incomes are generated using: `rgamma(n, 2) * 2000`.
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param digits Integer indicating the number of decimal places to be used.
#' Negative values are allowed (see [base::round()]).
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @return Returns a random gamma vector of income elements.
#' @keywords income
#' @export
#' @family variable functions
#' @seealso [base::gamma()]
#' @examples
#' income(10)
#' hist(income(10000))
#' pie(table(cut(income(10000), 10)))
income <-
function (n, digits = 2, name = "Income") {

    if (missing(n)) stop("`n` is missing")
    out <- round(stats::rgamma(n, 2) * 20000, digits = digits)
    varname(out, name)

}
