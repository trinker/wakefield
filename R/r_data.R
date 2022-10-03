#' Pre-Selected Column Data Set
#'
#' `r_data` - Generate a data set with pre-set columns selected.
#'
#' @param n The length to pass to the randomly generated vectors (number of rows).
#' @param \ldots A set of optionally named arguments.  Using \pkg{wakefield}
#' variable functions require no name or call parenthesis.
#' @details The pre-selected columns include:
#'
#' \itemize{
#'   \item ID
#'   \item Race
#'   \item Age
#'   \item Sex
#'   \item Hour
#'   \item IQ
#'   \item Height
#'   \item Died
#' }
#'
#' The user may use \ldots to add additional columns.  `r_data` is a
#' convenience function to quickly produce a data set.  For more specific usage
#' use the more flexible [wakefield::r_data_frame()] function.
#' @return Returns a [dplyr::tbl_df()].
#' @export
#' @rdname r_data
#' @seealso [wakefield::r_data_frame()]
#' @examples
#' r_data()
#' r_data(10)
#' r_data(10, paragraph, Attending = valid)
#'
#' peek(r_data_theme())
#' plot(r_data_theme(), flip=TRUE)
#'
#' r_data_theme(, "survey")
#' r_data_theme(, "survey2")
r_data <- function(n = 500, ...){
    r_data_frame(
        n = n,
        id,
        race,
        age,
        sex,
        hour,
        iq,
        height,
        died,
        ...
    )
}

#' Pre-Selected Column Data Set
#'
#' `r_data_theme` - Generate a themed data set with pre-set columns.
#'
#' @param data_theme A data theme.  Currently selections include:
#' \describe{
#'   \item{the_works}{all available variable functions}
#'   \item{survey}{ID column plus 10 numeric 5-point Likert type response columns}
#'   \item{survey2}{ID column plus 10 5-point Likert type response columns}
#' }
#' @export
#' @rdname r_data
r_data_theme <- function(n = 100, data_theme = "the_works") {

    parts <- get_theme(data_theme)

    header <- sprintf("require(dplyr)\n\nr_data_frame(n = %s,\n   ", n)
    mid <- paste(parts[["theme"]], collapse=",\n    ")
    footer <- "\n) "

    out <- tempdir()
    outfl <- paste0(gsub(":|\\s+|-", "_", Sys.time()), "_data_theme.R")

    cat(header, mid, footer, parts[["ply"]], "\n\n", file = file.path(out, outfl))

    source(file.path(out, outfl))[["value"]]

}

get_theme <- function(data_theme){

    switch(data_theme,
        the_works = {list(theme = variables(), ply = NULL)},
        survey = {list(theme = c("id", rep("likert(name = \"Item\")", 10)),
                     ply = "%>% as_integer(cols = -1)")},
        survey2 = {list(theme = c("id", rep("likert(name = \"Item\")", 10)),
                     ply = NULL)},
        stop("Suppy a valid theme")
    )
}

