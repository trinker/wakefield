#' Pre-Seleceted Column Data Set
#'
#' Generate a data set with pre-set columns selected.
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
#' The user may use \ldots to add additional columns.  \code{r_data} is a
#' convenience function to quickly produce a data set.  For more specific usage
#' use the more flexible \code{\link[wakefield]{r_data_frame}} function.
#' @return Returns a \code{\link[dplyr]{tbl_df}}.
#' @export
#' @seealso \code{\link[wakefield]{r_data_frame}}
#' @examples
#' r_data()
#' r_data(10)
#' r_data(10, paragraph, Attending = valid)
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



