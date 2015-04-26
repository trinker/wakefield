#' Data Frame Viewing
#'
#' Convenience function to view all the columns of the head
#' of a truncated \code{\link[base]{data.frame}}.  \code{peek} invisibly returns
#' \code{x}.  This makes its use ideal in a \pkg{dplyr}/\pkg{magrittr} pipeline.
#'
#' @param x A \code{\link[base]{data.frame}} object.
#' @param n Number of rows to display.
#' @param width The width of the columns to be displayed.
#' @param \ldots For internal use.
#' @return Prints a truncated head but invisibly returns \code{x}.
#' @seealso \code{\link[utils]{head}}
#' @export
#' @details By default \pkg{dplyr} does not print all columns of a data frame
#' (\code{tbl_df}).  This makes inspection of data difficult at times,
#' particularly with text string data.  \code{peek} allows the user to see a
#' truncated head for inspection purposes.
#' @examples
#' (dat1 <- r_data_frame(100, id, sentence, paragraph))
#' peek(dat1)
#' peek(dat1, n = 20)
#' peek(dat1, width = 40)
#'
#' library(dplyr)
#'
#' ## Use in a dplyr/magrittr pipeline to view the data (silly example)
#' par(mfrow = c(2, 2))
#'
#' r_data_frame(1000, id, sex, pet, employment, eye, sentence, paragraph) %>%
#'     peek %>%
#'     (function(x, ind = 2:5){ invisible(lapply(ind, function(i) pie(table(x[[i]]))))})
#'
#' ## A wider data set example
#' dat2 <- r_data_frame(100,
#'    age,
#'    animal,
#'    answer,
#'    area,
#'    birth,
#'    car,
#'    children,
#'    coin,
#'    date_stamp,
#'    death,
#'    dice,
#'    died,
#'    dna,
#'    dob,
#'    dummy,
#'    education,
#'    employment,
#'    eye,
#'    gpa,
#'    grade,
#'    grade_letter,
#'    grade_level,
#'    group,
#'    hair,
#'    height,
#'    height_cm,
#'    height_in,
#'    income,
#'    iq,
#'    language,
#'    level,
#'    likert,
#'    likert_5,
#'    likert_7,
#'    lorem_ipsum,
#'    lower,
#'    lower_factor,
#'    marital,
#'    month,
#'    name,
#'    normal,
#'    normal_round,
#'    paragraph,
#'    pet,
#'    political,
#'    race,
#'    sat,
#'    sentence,
#'    sex,
#'    smokes,
#'    speed,
#'    speed_kph,
#'    speed_mph,
#'    state,
#'    string,
#'    upper,
#'    upper_factor,
#'    valid,
#'    year,
#'    zip_code
#' )
#'
#' dat2
#' peek(dat2)
peek <-
function(x, n=10, width=10, ...) {

    WD <- options()[["width"]]
    options(width=3000)

    o <- head(truncdf(as.data.frame(x), width), n = n, ...)
    header <- "Source: local data frame [%s x %s]\n\n"
    cat(sprintf(header, nrow(x), ncol(x)))

    print(o)

    options(width=WD)
    invisible(x)
}


truncdf <-
function(x, end=10, begin=1) {
    x <- as.data.frame(x)
    DF <- data.frame(lapply(x, substr, begin, end), check.names=FALSE)
    names(DF) <- substring(names(DF), begin, end)
    class(DF) <- c("trunc", class(DF))
    DF
}



