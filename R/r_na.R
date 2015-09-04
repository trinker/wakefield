#' Title
#'
#' Description
#'
#' @param x A \code{\link[base]{data.frame}} or \code{\link[base]{list}} to
#' randomly replace elements with \code{NA}s.
#' @param cols Numeric indices of the columns to incude (use \code{-} to exlcude
#' as well).  Default is to assign random \code{NA}s to al columns except the
#' first column.
#' @param prob  The proportion of each column/vector elements to assign to
#' \code{NA}.
#' @return Returns a \code{\link[base]{data.frame}} or \code{\link[base]{list}}
#' with random missing values.
#' @keywords na missing
#' @export
#' @examples
#' r_na(mtcars)
#' r_na(mtcars, NULL)
#'
#'
#' library(dplyr)
#'
#' r_data_frame(
#'     n = 30,
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
#' ) %>%
#'     r_na(prob=.4)
r_na <- function(x, cols=-1, prob = .05){

    if (is.null(cols)) {
        x[] <- lapply(x, r_na_vector, prob=prob)
    } else {
        x[c(cols)] <- lapply(x[c(cols)], r_na_vector, prob=prob)
    }
    x
}

r_na_vector <- function(x, prob = .05) {
    x[sample(seq_along(x), round(prob * length(x)))] <- NA
    x
}




