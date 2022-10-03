#' Generate Random Vector of Languages
#'
#' Generate a random vector of languages from the
#' [wakefield::presidential_debates_2012()].
#'
#' @inheritParams r_sample_factor
#' @return Returns a random character vector of language elements.
#' @keywords language
#' @export
#' @family variable functions
#' @examples
#' language(10)
#' pie(table(language(10000)))
#'
#' lang <- wakefield::languages[sample(1:99, 6), ]
#' lang["prop"] <- lang[["N"]]/sum(lang[["N"]])
#' labs <- round(100 * lang[["prop"]], 1)
#' pie(lang[["prop"]], paste0(lang[["Language"]], "\n", labs, "%"))
language <-
function (n, x = wakefield::languages[["Language"]],
    prob = wakefield::languages[["Proportion"]], name = "Language") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x)
    varname(out, name)

}
