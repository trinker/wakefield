#' Generate Random Vector of Races
#'
#' Generate a random vector of races
#'
#' @details The races and probabilities used match approximate U.S. racial
#' make-up.  The default make up is:
#'
#' \tabular{lr}{
#'   \bold{Race}     \tab \bold{Percent}\cr
#'   White     \tab 63.70 \%\cr
#'   Hispanic  \tab 16.30 \%\cr
#'   Black     \tab 12.20 \%\cr
#'   Asian     \tab 4.70 \%\cr
#'   Bi-Racial \tab 1.90 \%\cr
#'   Other     \tab .20 \%\cr
#'   Native    \tab .70 \%\cr
#'   Hawaiian  \tab .15 \%
#' }
#'
#' @param name The name to assign to the output vector's \code{varname}
#' attribute (i.e., \code{attributes(x)[["varname"]]}).  This is auto assigned as
#' the column/vector name when used inside of \code{r_data_frame} or \code{r_list}.
#' @param races A vector of races to chose from.  See \bold{details} for the
#' default races.
#' @param prob A vector of probabilities to chose from.  See \bold{details} for
#' the default probabilities.
#' @param n The number elements to generate.  This can be auto set if used
#' inside of \code{r_data_frame} or \code{r_list}.
#' @return Returns a random vector of elements.
#' @keywords race
#' @export
#' @family variable functions
#' @examples
#' race("Race_Column", n=100)
#' table(race("Race_Column", n=1000))
#' race(races = c("B", "W"), prob = c(.7, .3), n = 25)
race <-
function (name = "Race", races = NULL, prob = NULL, n) {
    if (is.null(races)) {
        races <- c("White", "Black", "Native", "Asian", "Hawaiian",
            "Bi-Racial", "Other", "Hispanic")
    }
    if (is.null(prob)) {
        prob <- c(0.637, 0.122, 0.007, 0.047, 0.0015, 0.019,
            0.002, 0.163)
    }
    out <- sample(x = races, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = races)
    varname(out, name)
}

