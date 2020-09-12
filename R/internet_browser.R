#' Generate Random Vector of Internet Browsers
#'
#' Generate a random vector of Internet browser.
#'
#' @details The browser use and probabilities (from https://gs.statcounter.com/): 
#'
#' \tabular{lr}{
#'   \bold{ Browser} \tab \bold{Percent} \cr
#'   Chrome  \tab 50.27 \%\cr
#'   IE      \tab 17.50 \% \cr
#'   Firefox \tab 16.89 \%\cr
#'   Safari  \tab 9.94 \% \cr
#'   Opera   \tab 1.70 \%  \cr
#'   Android \tab 1.32 \% \cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of Internet browser elements.
#' @keywords browser
#' @references https://gs.statcounter.com/
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' internet_browser(20)
#' barplot(table(internet_browser(10000)))
#' pie(table(internet_browser(10000)))
internet_browser <- hijack(r_sample_factor,
    name = "Browser",
    x = c("Chrome", "IE", "Firefox", "Safari", "Opera", "Android"),
    prob = c(0.5027, 0.175, 0.1689, 0.0994, 0.017, 0.0132)
)

## read.table(text="Browser,Percent
## IE,17.5
## Chrome,50.27
## Firefox,16.89
## Safari,9.94
## Opera,1.7
## Android,1.32", header=TRUE, stringsAsFactors = FALSE, sep=",") %>%
##     mutate(
##         Proportion = Percent/100,
##         Percent = paste(Percent, "\\%")
##     ) %>%
##     arrange(desc(Proportion)) %>%
##     select(1, 3) %>% dput
##        select(-3) %>%
##        tabular() %>%
##        cat(file="clipboard")



