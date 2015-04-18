#' Generate Random Vector of states
#'
#' Generate a random factor vector of states.
#'
#' @details The state populations and probabilities:
#' \tabular{lrr}{
#'   \bold{ State}  \tab \bold{Population} \tab \bold{Percent} \%\cr
#'   California     \tab 37253956 \tab 12.09 \%\cr
#'   Texas          \tab 25145561 \tab 8.16 \% \cr
#'   New York       \tab 19378102 \tab 6.29 \% \cr
#'   Florida        \tab 18801310 \tab 6.10 \% \cr
#'   Illinois       \tab 12830632 \tab 4.16 \% \cr
#'   Pennsylvania   \tab 12702379 \tab 4.12 \% \cr
#'   Ohio           \tab 11536504 \tab 3.74 \% \cr
#'   Michigan       \tab  9883640 \tab 3.21 \% \cr
#'   Georgia        \tab  9687653 \tab 3.14 \% \cr
#'   North Carolina \tab  9535483 \tab 3.09 \% \cr
#'   New Jersey     \tab  8791894 \tab 2.85 \% \cr
#'   Virginia       \tab  8001024 \tab 2.60 \% \cr
#'   Washington     \tab  6724540 \tab 2.18 \% \cr
#'   Massachusetts  \tab  6547629 \tab 2.12 \% \cr
#'   Indiana        \tab  6483802 \tab 2.10 \% \cr
#'   Arizona        \tab  6392017 \tab 2.07 \% \cr
#'   Tennessee      \tab  6346105 \tab 2.06 \% \cr
#'   Missouri       \tab  5988927 \tab 1.94 \% \cr
#'   Maryland       \tab  5773552 \tab 1.87 \% \cr
#'   Wisconsin      \tab  5686986 \tab 1.85 \% \cr
#'   Minnesota      \tab  5303925 \tab 1.72 \% \cr
#'   Colorado       \tab  5029196 \tab 1.63 \% \cr
#'   Alabama        \tab  4779736 \tab 1.55 \% \cr
#'   South Carolina \tab  4625364 \tab 1.50 \% \cr
#'   Louisiana      \tab  4533372 \tab 1.47 \% \cr
#'   Kentucky       \tab  4339367 \tab 1.41 \% \cr
#'   Oregon         \tab  3831074 \tab 1.24 \% \cr
#'   Oklahoma       \tab  3751351 \tab 1.22 \% \cr
#'   Connecticut    \tab  3574097 \tab 1.16 \% \cr
#'   Iowa           \tab  3046355 \tab .99 \%  \cr
#'   Mississippi    \tab  2967297 \tab .96 \%  \cr
#'   Arkansas       \tab  2915918 \tab .95 \%  \cr
#'   Kansas         \tab  2853118 \tab .93 \%  \cr
#'   Utah           \tab  2763885 \tab .90 \%  \cr
#'   Nevada         \tab  2700551 \tab .88 \%  \cr
#'   New Mexico     \tab  2059179 \tab .67 \%  \cr
#'   West Virginia  \tab  1852994 \tab .60 \%  \cr
#'   Nebraska       \tab  1826341 \tab .59 \%  \cr
#'   Idaho          \tab  1567582 \tab .51 \%  \cr
#'   Hawaii         \tab  1360301 \tab .44 \%  \cr
#'   Maine          \tab  1328361 \tab .43 \%  \cr
#'   New Hampshire  \tab  1316470 \tab .43 \%  \cr
#'   Rhode Island   \tab  1052567 \tab .34 \%  \cr
#'   Montana        \tab   989415 \tab .32 \%  \cr
#'   Delaware       \tab   897934 \tab .29 \%  \cr
#'   South Dakota   \tab   814180 \tab .26 \%  \cr
#'   Alaska         \tab   710231 \tab .23 \%  \cr
#'   North Dakota   \tab   672591 \tab .22 \%  \cr
#'   Vermont        \tab   625741 \tab .20 \%  \cr
#'   Wyoming        \tab   563626 \tab .18 \%  \cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random character vector of state elements.
#' @keywords state
#' @export
#' @family variable functions
#' @examples
#' state(10)
#' pie(table(state(10000)))
#' sort(100*table(state(n <- 10000))/n)
state <-
function (n, x = state.name, prob = wakefield::state_populations[["Proportion"]],
    name = "state") {

    if (missing(n)) stop("`n` is missing")
    out <- sample(x = x, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = x)
    varname(out, name)

}


