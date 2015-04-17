#' Generate Random Vector of Political Parties
#'
#' Generate a random vector of political parties.
#'
#' @details The political parties and probabilities used match approximate U.S.
#' political make-up of registered voters (2014).  The default make up is:
#'
#' \tabular{lrr}{
#'   \bold{ Party} \tab \bold{N} \tab \bold{Percent} \cr
#'   Democrat     \tab 43,140,758 \tab 57.73\% \cr
#'   Republican   \tab 30,700,138 \tab 41.08\% \cr
#'   Constitution \tab   367,000 \tab   .49\% \cr
#'   Libertarian  \tab   278,446 \tab   .37\% \cr
#'   Green        \tab   246,145 \tab   .33\% \cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of political party elements.
#' @keywords poitical politics republican democrat
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' political(10)
#' barplot(table(political(10000)))
political <- hijack(r_sample,
    name = "Political",
    x = c("Constitution", "Democrat", "Green", "Libertarian", "Republican"),
    prob = c(0.577269133302094, 0.410800432748879, 0.00491084954793489,
    0.00372590303330866, 0.0032936813677832)
)

##
## data.frame(
##     Party = c("Constitution", "Democrat", "Green", "Libertarian", "Republican"),
##     N = c(367000, 43140758, 246145, 278446, 30700138)
## ) %>%
##     mutate(
##         Proportion = N/sum(N),
##         Percent = round(Proportion*100, 2)
##     ) %>%
##     arrange(desc(N)) %>%
##     select(-3) %>%
##     tabular() %>%
##     cat(file="clipboard")



